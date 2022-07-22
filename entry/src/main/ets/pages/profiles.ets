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
import router from '@system.router';

@Entry
@Component
struct profiles {
  @State userid1: number= 1198234
  @State username1: string= "David Jones"
  @State userimage1: Resource= $r('app.media.user1')
  @State userid2: number= 1198288
  @State username2: string= "Anne Johnson"
  @State userimage2: Resource= $r('app.media.user2')
  @State userid3: number= 1194578
  @State username3: string= "Chris Smith"
  @State userimage3: Resource= $r('app.media.user3')
  @State toggle1: boolean= true
  @State toggle2: boolean= false
  @State toggle3: boolean= false
  private topAppBar: AppBar.Model = new AppBar.Model()
  private navigationIcon: NavigationIcon.Model = new NavigationIcon.Model()
    .setIcon($r('app.media.leftarrow'))
    .setWidth('24vp').setHeight('24vp')
  private title: Title.Model = new Title.Model('All Profiles')
    .setFontSize(20)
    .setFontColor("#696969")
    .setTextAlign(TextAlign.Center)
    .setFontWeight(FontWeight.Normal)
  private options: OptionMenu.Model[] = [
    new OptionMenu.Model(1, "User Profile").setIcon($r('app.media.menu'))]
  @State model1: CardModel = new CardModel(this.username1, 'User-ID : ' + this.userid1)
  @State model2: CardModel = new CardModel(this.username2, 'User-ID : ' + this.userid2)
  @State model3: CardModel = new CardModel(this.username3, 'User-ID : ' + this.userid3)

  aboutToAppear() {
    this.topAppBar
      .setNavigationIcon(this.navigationIcon)
      .setTitleModel(this.title)
      .setOptions(this.options)
      .setBackgroundColor("#D3D3D3")
      .addNavigationListener(() => {
        console.log('Navigation icon clicked')
        router.back({ uri: 'pages/index' })
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
    this.model1.setMediaIcon(this.userimage1)
    this.model1.setShadowColor(Color.Black)
    this.model1.setShadowRadius(35)
    this.model1.setSubTitleFontSize(20)
    this.model1.setSubTitleFontWeight(FontWeight.Medium)
    this.model1.setActions([new button.Model('Edit', false, Color.White, Color.Black, 15, ButtonType.Capsule, 30, 60),
    new button.Model('Remove', true, Color.Black, Color.Green, 15, ButtonType.Capsule, 30, 60)])

    this.model2.setMediaIconPosition(MediaIconPosition.Right)
    this.model2.setCardType(CardType.Elevated)
    this.model2.setCardHeight(160)
    this.model2.setCardWidth(300)
    this.model2.setMediaIconWidth(80)
    this.model2.setMediaIconHeight(80)
    this.model2.setMediaIcon(this.userimage2)
    this.model2.setShadowColor(Color.Black)
    this.model2.setShadowRadius(35)
    this.model2.setSubTitleFontSize(20)
    this.model2.setSubTitleFontWeight(FontWeight.Medium)
    this.model2.setActions([new button.Model('Edit', false, Color.White, Color.Black, 15, ButtonType.Capsule, 30, 60),
    new button.Model('Remove', true, Color.Black, Color.Green, 15, ButtonType.Capsule, 30, 60)])

    this.model3.setMediaIconPosition(MediaIconPosition.Right)
    this.model3.setCardType(CardType.Elevated)
    this.model3.setCardHeight(160)
    this.model3.setCardWidth(300)
    this.model3.setMediaIconWidth(80)
    this.model3.setMediaIconHeight(80)
    this.model3.setMediaIcon(this.userimage3)
    this.model3.setShadowColor(Color.Black)
    this.model3.setShadowRadius(35)
    this.model3.setSubTitleFontSize(20)
    this.model3.setSubTitleFontWeight(FontWeight.Medium)
    this.model3.setActions([new button.Model('Edit', false, Color.White, Color.Black, 15, ButtonType.Capsule, 30, 60),
    new button.Model('Remove', true, Color.Black, Color.Green, 15, ButtonType.Capsule, 30, 60)])
  }

  @State Text: object = { name: 'news' }
  MoveFunc: () => void= function () {
    router.push({ uri: 'pages/edituser', params: { model1: this.model1 } })
  }

  build() {
    Column() {
      AppBar({ model: this.topAppBar })


      Navigator({ target: 'pages/edituser', type: NavigationType.Push }) {
        MaterialCard({
          model: $model1,
          toggler: true,
          func: this.MoveFunc,
          showToggler: true
        })
      }

      MaterialCard({
        model: $model2,
        toggler: false,
        func: this.MoveFunc,
        showToggler: true
      })

      MaterialCard({
        model: $model3,
        toggler: false,
        func: this.MoveFunc,
        showToggler: true
      })

    }.width('100%')
  }
}