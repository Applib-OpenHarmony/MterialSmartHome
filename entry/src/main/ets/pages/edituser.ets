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

import { AppBar, NavigationIcon, Title, Headline, OptionMenu } from '@ohos/material-appbar'
import { button, CardModel, CardType, MediaIconPosition, MaterialCard } from '@ohos/material-card'
import { MaterialTextField, MaterialTextFieldOptions, MaterialTextFieldType } from "@ohos/material-textfield"
import { MButton, ButtonVariant, ToggleButton } from "@ohos/material_button"
import router from '@system.router';

@Entry
@Component
struct edituser {
  private userid: string= "User ID : 1198234"
  private username: string= "David Jones"
  private userimage: string | Resource= $r('app.media.user1')
  private topAppBar: AppBar.Model = new AppBar.Model()
  private navigationIcon: NavigationIcon.Model = new NavigationIcon.Model()
    .setIcon($r('app.media.leftarrow'))
    .setWidth('24vp').setHeight('24vp')
  private title: Title.Model = new Title.Model('Edit Profile')
    .setFontSize(20)
    .setFontColor("#696969")
    .setTextAlign(TextAlign.Center)
    .setFontWeight(FontWeight.Normal)
  private options: OptionMenu.Model[] = [
    new OptionMenu.Model(1, "User Profile").setIcon($r('app.media.menu'))]
  @State model1: CardModel = new CardModel(this.username, this.userid)
  textFieldName: MaterialTextFieldOptions = new MaterialTextFieldOptions()
    .onTrailingIconClick((event) => {
      console.log("Trailing icon click:" + JSON.stringify(event))
    })
    .onLeadingIconClick((event) => {
      console.log("Leading icon click:" + event)
    })
    .setCharacterCounter(true, 10)
    .setHelperText('Required*')
    .setTextInputOptions({
      placeholderText: 'mail or phone',
      input: 'Name',
      caretColor: Color.Blue,
      fontFamily: 'cursive'
    })
  textFieldPhone: MaterialTextFieldOptions = new MaterialTextFieldOptions()
    .onTrailingIconClick((event) => {
      console.log("Trailing icon click:" + JSON.stringify(event))
    })
    .onLeadingIconClick((event) => {
      console.log("Leading icon click:" + event)
    })
    .setCharacterCounter(true, 10)
    .setHelperText('Required*')
    .setTextInputOptions({
      placeholderText: 'mail or phone',
      input: 'Phone',
      caretColor: Color.Blue,
      fontFamily: 'cursive'
    })
  textFieldEmail: MaterialTextFieldOptions = new MaterialTextFieldOptions()
    .onTrailingIconClick((event) => {
      console.log("Trailing icon click:" + JSON.stringify(event))
    })
    .onLeadingIconClick((event) => {
      console.log("Leading icon click:" + event)
    })
    .setCharacterCounter(true, 10)
    .setHelperText('Required*')
    .setTextInputOptions({
      placeholderText: 'mail or phone',
      input: 'Email',
      caretColor: Color.Blue,
      fontFamily: 'cursive'
    })

  aboutToAppear() {
    this.topAppBar
      .setNavigationIcon(this.navigationIcon)
      .setTitleModel(this.title)
      .setOptions(this.options)
      .setBackgroundColor("#D3D3D3")
      .addNavigationListener(() => {
        console.log('Navigation icon clicked')
        router.back({ uri: 'pages/profiles' })
      })
      .addOptionListener((option: OptionMenu.Model) => {
        console.log('Option:: ' + option.getLabel())
      })


    this.model1.setMediaIconPosition(MediaIconPosition.Right)
    this.model1.setCardType(CardType.Elevated)
    this.model1.setCardHeight(160)
    this.model1.setCardWidth(300)
    this.model1.setMediaIconWidth(80)
    this.model1.setMediaIconHeight(80)
    this.model1.setMediaIcon(this.userimage)
    this.model1.setShadowColor(Color.Black)
    this.model1.setShadowRadius(35)
    this.model1.setSubTitleFontSize(20)
    this.model1.setSubTitleFontWeight(FontWeight.Medium)

  }

  readMoreOpenClose() {
    router.back({ uri: 'pages/profiles' })
  }

  MoveFunc: () => void= function () {
    console.log("hii")
  }

  build() {
    Column() {
      AppBar({ model: this.topAppBar })

      MaterialCard({
        model: $model1,
        toggler: false,
        func: this.MoveFunc,
        showToggler: false
      })

      Text("Name")
        .width('90%')
        .fontSize(20)
        .margin({ left: 10 })
        .fontWeight(FontWeight.Bold)
        .fontFamily('calibri')
        .fontColor(Color.Grey)
        .margin({ left: 15 })
        .padding({ top: 30, bottom: 5 })

      MaterialTextField({ textFieldParameters: this.textFieldName, textFieldType: MaterialTextFieldType.Filled })

      Text("Phone Number")
        .width('90%')
        .fontSize(20)
        .margin({ left: 10 })
        .fontWeight(FontWeight.Bold)
        .fontFamily('calibri')
        .fontColor(Color.Grey)
        .margin({ left: 15 })
        .padding({ top: 15, bottom: 5 })

      MaterialTextField({ textFieldParameters: this.textFieldPhone, textFieldType: MaterialTextFieldType.Filled })

      Text("Email")
        .width('90%')
        .fontSize(20)
        .margin({ left: 10 })
        .fontWeight(FontWeight.Bold)
        .fontFamily('calibri')
        .fontColor(Color.Grey)
        .margin({ left: 15 })
        .padding({ top: 15, bottom: 5 })

      MaterialTextField({ textFieldParameters: this.textFieldEmail, textFieldType: MaterialTextFieldType.Filled })

      Row() {
        MButton({
          options: {
            variant: ButtonVariant.CONTAINED,
            backgroundColor: "#ff0477ff",
            content: "Edit Profile",
            margin: { left: 100 },
            fontSize: 20,
            fontColor: Color.White
          },
          clickCallBack: {
            callback: () => this.readMoreOpenClose()
          }
        })
      }.width('90%').padding({ top: 60 })

    }.width('100%')
  }
}