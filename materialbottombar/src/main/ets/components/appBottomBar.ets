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

import { NavigationIcon } from './navigationIcon'
import { FloatingActionButton } from './floatingActionButton'
import { OptionMenu } from './optionMenu'
import { FabPosition } from './FabPosition'


@Component
struct BottomBar {
  @State private model: BottomBar.Model = new BottomBar.Model()

  private buildUI(): boolean {
    return this.model != undefined && this.model != null && this.model.buildUI()
  }

  build() {
    if (this.buildUI()) {
      Column() {
        Row() {
          if (this.model.getFabPosition() == FabPosition.Right) {
            OptionMenu({
              options: this.model.getOptions(),
              optionClickListener: this.model.getOptionListener(),
              fabPosition:this.model.getFabPosition()
            })
            Flex({ direction: FlexDirection.Row,
              justifyContent: FlexAlign.End,
              alignItems: ItemAlign.Center }) {
              FloatingActionButton({
                model: this.model.getFabModel(),
                fabClickListener: this.model.getFabListener()
              })
            }.flexGrow(1).flexShrink(1).padding({ right: '16vp' })
          }
          if (this.model.getFabPosition() == FabPosition.Center) {
            Flex() {
              NavigationIcon({
                model: this.model.getNavigationIcon(),
                navigationListener: this.model.getNavigationListener()
              })
            }.width('20%')

            Flex() {
              NavigationIcon({
                model: this.model.getIcon2(),
                navigationListener: this.model.getIcon2Listener()
              })
            }.width('20%')

            Flex({ justifyContent: FlexAlign.Center }) {
              FloatingActionButton({
                model: this.model.getFabModel(),
                fabClickListener: this.model.getFabListener()
              })
            }.width('20%')

            Flex({ justifyContent: FlexAlign.Center }) {
              NavigationIcon({
                model: this.model.getIcon3(),
                navigationListener: this.model.getIcon3Listener()
              })
            }.width('20%')

            Flex({ justifyContent: FlexAlign.End }) {
              OptionMenu({
                options: this.model.getOptions(),
                optionClickListener: this.model.getOptionListener()
              })
            }.width('20%')

          }
        }
        .width('100%')
        .padding({ left: '16vp', right: '8vp' })
        .height(this.model.getFabPosition() == FabPosition.Right ? '80vp' : '64vp')
      }.backgroundColor(this.model.getBackgroundColor())
    }
  }
}

namespace BottomBar {
  export class Model {
    private navigationIcon: NavigationIcon.Model = undefined
    private Icon2: NavigationIcon.Model = undefined
    private Icon3: NavigationIcon.Model = undefined
    private floatingActionButton: FloatingActionButton.Model = undefined
    private options: OptionMenu.Model [] = []
    private backgroundColor: string | Resource | Color = Color.Blue
    private fabPosition: FabPosition = FabPosition.Center
    private navigationClickListener: () => void = undefined
    private icon2Listener: () => void = undefined
    private icon3Listener: () => void = undefined
    private fabClickListener: () => void = undefined
    private optionClickListener: (option: OptionMenu.Model) => void = undefined

    buildUI(): boolean {
      return this.showNavigationIcon() || this.hasFab() || this.hasOptions()
    }

    getBackgroundColor(): string | ResourceColor {
      return this.backgroundColor
    }

    setBackgroundColor(color: string | ResourceColor): Model {
      if (color == undefined || color == null) {
        this.backgroundColor = Color.Blue
      } else {
        this.backgroundColor = color
      }
      return this
    }

    getFabPosition(): FabPosition {
      return this.fabPosition
    }

    setFabPosition(fabPosition: FabPosition): Model {
      if (fabPosition != null && fabPosition != undefined) {
        this.fabPosition = fabPosition
      } else {
        this.fabPosition = FabPosition.Center
      }
      return this
    }

    /* Navigation */

    showNavigationIcon(): boolean {
      return this.navigationIcon != undefined && this.navigationIcon != null
    }

    getNavigationIcon(): NavigationIcon.Model {
      return this.navigationIcon
    }

    setNavigationIcon(icon: NavigationIcon.Model): Model {
      this.navigationIcon = icon
      return this
    }

    addNavigationListener(listener: () => void): Model {
      this.navigationClickListener = listener
      return this
    }

    getNavigationListener(): () => void {
      return this.navigationClickListener
    }

    /* Icon2 */

    showIcon2(): boolean {
      return this.Icon2 != undefined && this.Icon2 != null
    }

    getIcon2(): NavigationIcon.Model {
      return this.Icon2
    }

    setIcon2(icon: NavigationIcon.Model): Model {
      this.Icon2 = icon
      return this
    }

    addIcon2Listener(listener: () => void): Model {
      this.icon2Listener = listener
      return this
    }

    getIcon2Listener(): () => void {
      return this.icon2Listener
    }



    /* Floating Action Button */

    hasFab(): boolean {
      return this.floatingActionButton != undefined && this.floatingActionButton != null
    }

    getFabModel(): FloatingActionButton.Model {
      return this.floatingActionButton
    }

    setFabModel(model: FloatingActionButton.Model): Model {
      this.floatingActionButton = model
      return this
    }

    addFabListener(listener: () => void): Model {
      this.fabClickListener = listener
      return this
    }

    getFabListener(): () => void {
      return this.fabClickListener
    }

    /* Icon3 */

    showIcon3(): boolean {
      return this.Icon3 != undefined && this.Icon3 != null
    }

    getIcon3(): NavigationIcon.Model {
      return this.Icon3
    }

    setIcon3(icon: NavigationIcon.Model): Model {
      this.Icon3 = icon
      return this
    }

    addIcon3Listener(listener: () => void): Model {
      this.icon3Listener = listener
      return this
    }

    getIcon3Listener(): () => void {
      return this.icon3Listener
    }

    /* Options */

    hasOptions(): boolean {
      return this.options != undefined && this.options != null && this.options.length > 0
    }

    getOptions(): OptionMenu.Model [] {
      return this.options
    }

    setOptions(options: OptionMenu.Model []): Model {
      if (options == undefined || options == null) {
        this.options = []
      } else {
        this.options = options
      }
      return this
    }

    addOptionListener(listener: (option: OptionMenu.Model) => void): Model {
      this.optionClickListener = listener
      return this
    }

    getOptionListener(): (option: OptionMenu.Model) => void {
      return this.optionClickListener
    }
  }
}

export {
  BottomBar, FloatingActionButton, OptionMenu, NavigationIcon
}

export { FabPosition } from './FabPosition'