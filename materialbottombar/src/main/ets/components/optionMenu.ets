/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { FabPosition } from './FabPosition'

@Component
export struct OptionMenu {
  private options: OptionMenu.Model [] = []
  private optionClickListener: (option: OptionMenu.Model) => void = undefined
  private fabPosition: FabPosition = FabPosition.Center

  hasOptions(): boolean {
    return this.options != undefined && this.options != null && this.options.length > 0
  }

  showOverflowMenu(): boolean {
    if(this.fabPosition == FabPosition.Center) return this.options.length >= 3
    else  return this.options.length >= 5
  }

  getOverflowMenuOptions(): OptionMenu.Model [] {
    if(this.fabPosition == FabPosition.Center) return this.options.slice(1, this.options.length)
    else return this.options.slice(3, this.options.length)
  }

  getOptions(): OptionMenu.Model [] {
    if (this.showOverflowMenu() && this.fabPosition==FabPosition.Center) {
      return this.options.slice(0, 1)
    }
    if(this.showOverflowMenu() && this.fabPosition==FabPosition.Right){
      return this.options.slice(0, 3)
    }
    return this.options
  }

  private onOptionClick(option: OptionMenu.Model) {
    if (this.optionClickListener != undefined && this.optionClickListener != null) {
      this.optionClickListener(option)
    }
  }

  @Builder
  private OverflowMenuBuilder() {
    Column() {
      List() {
        ForEach(this.getOverflowMenuOptions(),
          (item, index) => {
            ListItem() {
              this.OverflowMenuItem(
                item,
                index != (this.getOverflowMenuOptions().length - 1)
              )
            }
          }, item => item.getId())
      }
    }
  }

  @Builder
  private OverflowMenuItem(option: OptionMenu.Model, showDivider: boolean) {
    Flex() {
      Column() {
        Text(option.getText())
          .width('100%')
          .fontSize('18fp')
          .padding({ left: 4, right: 4 })

        if (showDivider) {
          Divider().height(1).margin({ top: 8 })
        }
      }
    }
    .margin(4)
    .onClick(() => this.onOptionClick(option))
  }

  build() {
    Row() {
      if (this.showOverflowMenu() && this.fabPosition==FabPosition.Right) {
        Image($r('app.media.dots'))
          .width('24vp')
          .height('24vp')
          .margin({ right: '8vp' })
          .objectFit(ImageFit.Fill | ImageFit.Contain)
          .bindMenu(this.OverflowMenuBuilder())
      }
      if (this.hasOptions()) {
        ForEach(this.getOptions(),
          (item, index) => {
            Image(item.getIcon())
              .width(item.getWidth())
              .height(item.getHeight())
              .margin({ left: index > 0 ? '8vp' : '0vp' })
              .objectFit(ImageFit.Fill | ImageFit.Contain)
              .onClick(() => this.onOptionClick(item))
          }, item => item.getId())
      }

      if (this.showOverflowMenu() && this.fabPosition==FabPosition.Center) {
        Image($r('app.media.dots'))
          .width('24vp')
          .height('24vp')
          .margin({ left: '8vp' })
          .objectFit(ImageFit.Fill | ImageFit.Contain)
          .bindMenu(this.OverflowMenuBuilder())
      }
    }

  }
}

export namespace OptionMenu {
  export class Model {
    private id: string | number = undefined
    private text: string | Resource = ''
    private icon: Resource = undefined

    private width: string | number = '24vp'
    private height: string | number = '24vp'

    constructor(id) {
      this.id = id
    }

    buildUI(): boolean {
      return (this.id != undefined && this.id != null)
    }

    getId(): string | number {
      return this.id
    }

    setId(id: string | number): Model {
      this.id = id
      return this
    }

    getText(): string | Resource {
      return this.text
    }

    setText(text: string | Resource): Model {
      if (text == undefined || text == null) {
        this.text = ''
      } else {
        this.text = text
      }
      return this
    }

    hasIcon(): boolean {
      return this.icon != undefined && this.icon != null
    }

    getIcon(): Resource {
      return this.icon
    }

    setIcon(icon: Resource): Model {
      this.icon = icon
      return this
    }

    getWidth(): string | number {
      return this.width
    }

    setWidth(width: string | number): Model {
      if (width == undefined || width == null) {
        this.width = '24vp'
      } else {
        this.width = width
      }
      return this
    }

    getHeight(): string | number {
      return this.height
    }

    setHeight(height: string | number): Model {
      if (height == undefined || height == null) {
        this.height = '24vp'
      } else {
        this.height = height
      }
      return this
    }
  }
}