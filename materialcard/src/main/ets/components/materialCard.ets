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

import { CardModel, CardType, MediaIconPosition } from './cardmodel'
import router from '@system.router';


@Component
export struct MaterialCard {
  @Link model: CardModel
  @State toggler: boolean = false;
  @State show: Visibility= Visibility.Visible
  @State showToggler: boolean= false
  func: () => void

  build() {
    Column() {
      // UI
      Row({ space: 10 }) {
        if (this.model.getMediaIconPosition() == MediaIconPosition.Top) {
          if (this.model.getMediaIcon() != undefined) {
            Image(this.model.getMediaIcon())
              .objectFit(ImageFit.Cover)
              .width(this.model.getMediaIconWidth())
              .height(this.model.getMediaIconHeight())
              .margin({ bottom: 16, top: 10, left: 10, right: 10 })
              .borderRadius(this.model.getBorderRadius())

            Toggle({ type: ToggleType.Switch, isOn: this.toggler })
              .selectedColor("#ff0477ff")
              .switchPointColor(0xe5ffffff)
              .onChange((isOn: boolean=this.toggler) => {
                this.model.setTogState(isOn)
                console.log("State " + this.model.getTogState())
                if (isOn) {
                  this.toggler = true
                }
                else {
                  this.toggler = false
                }
              })
          }
        }
      }.width(this.model.getCardWidth())

      Row() {
        //Icon that comes ahead of title
        if (this.model.getLeadingIcon() != undefined && this.model.getMediaIconPosition() != MediaIconPosition.Right) {
          Image(this.model.getLeadingIcon())
            .objectFit(ImageFit.Cover)
            .width(this.model.getLeadingIconWidth())
            .height(this.model.getLeadingIconHeight())
            .padding({ left: 16, top: 16, right: 8 })
        }
        Column() {
          //Title Text
          Text(this.model.getTitle())
            .fontSize(this.model.getTitleFontSize())
            .fontWeight(this.model.getTitleFontWeight())
            .margin({ top: 8, left: this.model.getLeadingIcon() == undefined ? 16 : 8 })
            .fontColor(this.model.getTitleFontColor())
            .alignSelf(ItemAlign.Start)
          //SubTitle Text
          Text(this.model.getSubTitle())
            .fontSize(this.model.getSubTitleFontSize())
            .fontWeight(this.model.getSubTitleFontWeight())
            .fontColor(this.model.getSubTitleFontColor())
            .margin({ top: 4, left: this.model.getLeadingIcon() == undefined ? 16 : 8 })
            .alignSelf(ItemAlign.Start)
        }.width(this.model.getMediaIconPosition() == MediaIconPosition.Right ? '60%' : '60%')

        if (this.model.getMediaIcon() != undefined && this.model.getMediaIconPosition() == MediaIconPosition.Right) {
          Image(this.model.getMediaIcon())
            .objectFit(ImageFit.Cover)
            .width(this.model.getMediaIconWidth())
            .height(this.model.getMediaIconHeight())
            .margin(16)
        }
      }.width(this.model.getCardWidth())

      if (this.model.getMediaIcon() != undefined && this.model.getMediaIconPosition() == MediaIconPosition.Middle) {
        Image(this.model.getMediaIcon())
          .objectFit(ImageFit.Cover)
          .width(this.model.getMediaIconWidth())
          .height(this.model.getMediaIconHeight())
          .margin(16)
      }
      if (this.model.getSupportingText() != "") {
        Text(this.model.getSupportingText())
          .fontSize(this.model.getSupportingTextFontSize())
          .fontWeight(this.model.getSupportingTextFontWeight())
          .margin(8)
          .alignSelf(ItemAlign.Start)
          .fontColor(this.model.getSupportingTextFontColor())
      }
      if (this.model.getShowDivider()) {
        Divider().margin(4).strokeWidth(1)
      }
      if (this.model.getButtons().length != 0) {
        Column() {
          Text(this.model.getButtonHeader())
            .margin({ top: 16, left: 16, bottom: 4 })
            .fontWeight(FontWeight.Bold)
            .fontSize(22)
            .alignSelf(ItemAlign.Start)
          //list of buttons
          List() {
            ForEach(this.model.getButtons(), (item) => {
              ListItem() {
                Button(item.buttonText, { type: item.buttonType, stateEffect: true })
                  .backgroundColor(item.buttonColor)
                  .width(item.buttonWidth)
                  .height(item.buttonHeight)
                  .margin(8)
                  .borderRadius(8)
                  .fontColor(item.buttonTextColor)
                  .onClick((event: ClickEvent) => {
                    let buttonClick = this.model.getButtonClick()
                    if (buttonClick != undefined && buttonClick != null) {
                      buttonClick(item)
                    }
                  })
              }
            }, item => item.buttonId)
          }
          .width('90%')
          .height(64)
          .listDirection(Axis.Horizontal)
        }.width(this.model.getMediaIconWidth())
      }
      Row() {
        List() {
          ForEach(this.model.getActions(), (item) => {
            ListItem() {
              if (!item.isText) {
                Button(item.buttonText, { type: item, stateEffect: true })
                  .backgroundColor(Color.White)
                  .width(item.buttonWidth)
                  .height(item.buttonHeight)
                  .margin(8)
                  .borderRadius(8)
                  .fontColor("#FF6700")
                  .fontSize(item.fontSize)
                  .onClick((event: ClickEvent) => {
                    this.func()
                  })
              }
              else {
                Text(item.buttonText)
                  .width(item.buttonWidth)
                  .height(item.buttonHeight)
                  .margin(8)
                  .borderRadius(8)
                  .fontColor("#FF6700")
                  .fontSize(item.fontSize)
                  .onClick((event: ClickEvent) => {
                    this.show = Visibility.None
                  })

              }
            }
          }, item => item.buttonId)
        }
        .listDirection(Axis.Horizontal)
        .width('80%').align(Alignment.Start)
        .height(50)

        if (this.showToggler) {
          Toggle({ type: ToggleType.Switch, isOn: this.toggler })
            .selectedColor("#ff0477ff")
            .onChange((isOn: boolean = this.toggler) => {
              if (isOn) {
                this.toggler = true;
              }
            })
        }
      }.height(40).width('80%')
    }
    .visibility(this.show)
    .borderWidth((this.model.getCardType() == CardType.Outlined) ? this.model.getCardBorderWidth() : 0.5)
    .borderRadius(this.model.getBorderRadius())
    .margin({ top: 16 })
    .height(this.model.getCardHeight())
    .width(this.model.getCardWidth())
    .backgroundColor(this.model.getCardBackgroundColor())
    .borderColor(this.model.getCardBorderColor())
    .shadow({ radius: this.model.getCardType() == CardType.Elevated ? this.model.getShadowRadius() : 0,
      color: this.model.getShadowColor() })
    .onClick((event: ClickEvent) => {
      let cardClick = this.model.getCardClick()
      if (cardClick != undefined && cardClick != null) {
        cardClick()
      }
    })
  }
}

export { button } from "./button"

export { CardModel, CardType, MediaIconPosition } from "./cardModel"