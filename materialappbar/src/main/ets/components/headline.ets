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
export struct Headline {
  private model: Headline.Model = undefined

  build() {
    if (this.model != undefined && this.model != null) {
      Row() {
        Text(this.model.getHeadline())
          .maxLines(2)
          .fontSize(this.model.getFontSize())
          .fontColor(this.model.getFontColor())
          .fontWeight(this.model.getFontWeight())
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding({ left: '16vp', right: '16vp', bottom: '16vp' })
    }
  }
}

export namespace Headline {
  export class Model {
    private headline: string | Resource = ''

    private fontSize: string | number = '18fp'
    private fontColor: string | ResourceColor = Color.White
    private fontWeight: string | number | FontWeight = FontWeight.Normal

    constructor(headline: string | Resource) {
      if (headline == undefined || headline == null) {
        this.headline = ''
      } else {
        this.headline = headline
      }
    }

    getHeadline(): string | Resource {
      return this.headline
    }

    getFontSize(): string | number {
      return this.fontSize
    }

    setFontSize(size: string | number): Model {
      if (size == undefined || size == null) {
        this.fontSize = '18fp'
      } else {
        this.fontSize = size
      }
      return this
    }

    getFontWeight(): string | number | FontWeight {
      return this.fontWeight
    }

    setFontWeight(weight: string | number | FontWeight): Model {
      if (weight == undefined || weight == null) {
        this.fontWeight = FontWeight.Normal
      } else {
        this.fontWeight = weight
      }
      return this
    }

    getFontColor(): string | ResourceColor {
      return this.fontColor
    }

    setFontColor(color: string | ResourceColor): Model {
      if (color == undefined || color == null) {
        this.fontColor = Color.White
      } else {
        this.fontColor = color
      }
      return this
    }
  }
}