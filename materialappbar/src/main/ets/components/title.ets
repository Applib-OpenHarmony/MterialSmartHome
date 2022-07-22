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
export struct Title {
  private model: Title.Model = undefined

  build() {
    if (this.model != undefined && this.model != null) {
      Row() {
        Text(this.model.getTitle())
          .maxLines(1)
          .flexGrow(1)
          .fontSize(this.model.getFontSize())
          .fontColor(this.model.getFontColor())
          .fontWeight(this.model.getFontWeight())
          .textAlign(this.model.getTextAlign())
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }.width('100%')
    }
  }
}

export namespace Title {
  export class Model {
    private title: string | Resource = ''

    private fontSize: string | number = '18fp'
    private textAlign: TextAlign = TextAlign.Start
    private fontColor: string | ResourceColor = Color.White
    private fontWeight: string | number | FontWeight = FontWeight.Normal

    constructor(title: string | Resource) {
      if (title == undefined || title == null) {
        this.title = ''
      } else {
        this.title = title
      }
    }

    getTitle(): string | Resource {
      return this.title
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

    getTextAlign(): TextAlign {
      return this.textAlign
    }

    setTextAlign(align: TextAlign): Model {
      if (align == undefined || align == null) {
        this.textAlign = TextAlign.Start
      } else {
        this.textAlign = align
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