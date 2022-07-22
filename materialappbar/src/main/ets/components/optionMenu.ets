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

@Component
export struct OptionMenu {
  private options: OptionMenu.Model [] = []
  private optionClickListener: (option: OptionMenu.Model) => void = undefined

  hasOptions(): boolean {
    return this.options != undefined && this.options != null && this.options.length > 0
  }

  showOverflowMenu(): boolean {
    return this.options.length >= 3
  }

  getOverflowMenuOptions(): OptionMenu.Model [] {
    return this.options.slice(2, this.options.length)
  }

  getOptions(): OptionMenu.Model [] {
    if (this.showOverflowMenu()) {
      return this.options.slice(0, 2)
    }
    return this.options
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
    if (option.buildUI()) {
      Flex() {
        Column() {
          Text(option.getLabel())
            .width('100%')
            .fontSize('18fp')
            .padding({ left: '4vp', right: '4vp' })

          if (showDivider) {
            Divider().height(1).margin({ top: '8vp' })
          }
        }
      }
      .margin('4vp')
      .onClick(() => this.onOptionClick(option))
    }
  }

  private onOptionClick(option: OptionMenu.Model) {
    if (this.optionClickListener != undefined && this.optionClickListener != null) {
      this.optionClickListener(option)
    }
  }

  build() {
    Row() {
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

      if (this.showOverflowMenu()) {
        Image($r('app.media.dot_menu'))
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
    private label: string | Resource = ''

    private icon: Resource = undefined

    private width: string | number = '24vp'
    private height: string | number = '24vp'

    constructor(id, label) {
      this.id = id
      this.label = label
    }

    buildUI(): boolean {
      return this.label != undefined && this.label != null && this.label != ''
    }

    getId(): string | number {
      return this.id
    }

    setId(id: string | number): Model {
      this.id = id
      return this
    }

    getLabel(): string | Resource {
      return this.label
    }

    setLabel(label: string | Resource): Model {
      if (label == undefined || label == null) {
        this.label = ''
      } else {
        this.label = label
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