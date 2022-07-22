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
export struct FloatingActionButton {
  private model: FloatingActionButton.Model = undefined
  private fabClickListener: () => void = undefined

  private onClick() {
    if (this.fabClickListener != undefined && this.fabClickListener != null) {
      this.fabClickListener()
    }
  }

  build() {
    if (this.model != undefined && this.model != null && this.model.getFabIcon()!=null  && this.model.getFabIcon()!=undefined) {
      Stack() {
        Rect()
          .width(this.model.getFabWidth())
          .height(this.model.getFabHeight())
          .fill(Color.Black)
          .radius(this.model.getFabPosition() == FabPosition.Right ? '18vp' : '30vp')

        Image(this.model.getFabIcon())
          .width(this.model.getFabIconWidth())
          .height(this.model.getFabIconHeight())


      }.margin({ top: this.model.getFabPosition() == FabPosition.Right ? '0vp' : '-32vp' })
      .onClick(() => this.onClick())
    }
  }
}

export namespace FloatingActionButton {
  export class Model {
    private fabHeight: string = '56vp'
    private fabWidth: string = '56vp'
    private fabPosition: FabPosition = FabPosition.Center
    private fabIcon: Resource = $r('app.media.plus')
    private fabIconWidth: string = '28vp'
    private fabIconHeight: string = '28vp'

    getFabIcon(): Resource{
      return this.fabIcon
    }

    setFabIcon(fabIcon: Resource): Model{
      if (fabIcon != null && fabIcon != undefined) {
        this.fabIcon = fabIcon
      }
      return this
    }

    getFabIconHeight(): string  {
      return this.fabIconWidth
    }

    setFabIconHeight(fabIconHeight: string): Model {
      if (fabIconHeight != null && fabIconHeight != undefined) {
        this.fabIconHeight = fabIconHeight
      } else {
        this.fabIconHeight = '28vp'
      }
      return this
    }

    getFabIconWidth(): string  {
      return this.fabIconWidth
    }

    setFabIconWidth(fabIconWidth: string): Model {
      if (fabIconWidth != null && fabIconWidth != undefined) {
        this.fabIconWidth = fabIconWidth
      } else {
        this.fabIconWidth = '28vp'
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

    getFabHeight(): string  {
      return this.fabHeight
    }

    setFabHeight(fabHeight: string): Model {
      if (fabHeight != null && fabHeight != undefined) {
        this.fabHeight = fabHeight
      } else {
        this.fabHeight = '56vp'
      }
      return this
    }

    getFabWidth(): string  {
      return this.fabWidth
    }

    setFabWidth(fabWidth: string): Model {
      if (fabWidth != null && fabWidth != undefined) {
        this.fabWidth = fabWidth
      } else {
        this.fabWidth = '56vp'
      }
      return this
    }
  }
}
