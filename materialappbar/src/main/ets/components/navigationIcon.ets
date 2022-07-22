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
export struct NavigationIcon {
  private model: NavigationIcon.Model = undefined
  private navigationListener: () => void = undefined

  private onClick() {
    if (this.navigationListener != undefined && this.navigationListener != null) {
      this.navigationListener()
    }
  }

  build() {
    if (this.model != undefined && this.model != null && this.model.hasIcon()) {
      Row() {
        Image(this.model.getIcon())
          .width(this.model.getWidth())
          .height(this.model.getHeight())
          .onClick(() => this.onClick())
      }
    }
  }
}

export namespace NavigationIcon {
  export class Model {
    private icon: Resource = undefined

    private width: string | number = '24vp'
    private height: string | number = '24vp'

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