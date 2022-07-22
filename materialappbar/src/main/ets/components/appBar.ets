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

import { Title } from './title'
import { Headline } from './headline'
import { OptionMenu } from './optionMenu'
import { NavigationIcon } from './navigationIcon'

@Component
struct AppBar {
  @State private model: AppBar.Model = new AppBar.Model()

  private buildUI(): boolean {
    return this.model != undefined && this.model != null && this.model.buildUI()
  }

  build() {
    if (this.buildUI()) {
      Column() {

        Row() {
          NavigationIcon({
            model: this.model.getNavigationIcon(),
            navigationListener: this.model.getNavigationListener()
          })

          Flex() {
            Title({ model: this.model.getTitleModel() })
          }
          .flexGrow(1).flexShrink(1)
          .padding({ left: '16vp', right: '16vp' })

          OptionMenu({
            options: this.model.getOptions(),
            optionClickListener: this.model.getOptionListener()
          })

        }
        .width("100%")
        .height('60vp')
        .padding({ left: '16vp', right: '16vp' })

        Headline({ model: this.model.getHeadlineModel() })

      }
      .backgroundColor(this.model.getBackgroundColor())
    }
  }
}

namespace AppBar {
  export class Model {
    private navigationIcon: NavigationIcon.Model = undefined

    private title: Title.Model = undefined

    private options: OptionMenu.Model [] = []

    private headline: Headline.Model = undefined

    private backgroundColor: string | ResourceColor = Color.Blue

    private navigationClickListener: () => void = undefined
    private optionClickListener: (option: OptionMenu.Model) => void = undefined

    buildUI(): boolean {
      return this.showNavigationIcon() || this.hasTitle() || this.hasOptions()
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

    /* Title */

    hasTitle(): boolean {
      return this.title != undefined && this.title != null
    }

    getTitleModel(): Title.Model {
      return this.title
    }

    setTitleModel(model: Title.Model): Model {
      this.title = model
      return this
    }

    /* Headline */

    hasHeadline(): boolean {
      return this.headline != undefined && this.headline != null
    }

    getHeadlineModel(): Headline.Model {
      return this.headline
    }

    setHeadlineModel(model: Headline.Model): Model {
      this.headline = model
      return this
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
  AppBar, Title, Headline, OptionMenu, NavigationIcon
}