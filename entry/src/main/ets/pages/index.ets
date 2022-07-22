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
import { TabBarOptions, TabBar, TabBarType, IconType, TabBarModel }  from '@ohos/material-tabs'
import { button, CardModel, CardType, MediaIconPosition, MaterialCard } from '@ohos/material-card'
import { MaterialSlider, SliderModel, SliderType }  from '@ohos/materialslider'
import router from '@system.router';
import { bottomBar } from './BottomBar'

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  private topAppBar: AppBar.Model = new AppBar.Model()
  private navigationIcon: NavigationIcon.Model = new NavigationIcon.Model()
    .setIcon($r('app.media.menu'))
    .setWidth('24vp').setHeight('20vp')
  private title: Title.Model = new Title.Model('Smart Home')
    .setFontSize(20)
    .setFontColor("#696969")
    .setTextAlign(TextAlign.Center)
    .setFontWeight(FontWeight.Normal)
  private options: OptionMenu.Model[] = [
    new OptionMenu.Model(1, "User Profile").setIcon($r('app.media.user2'))]
  private tabBar: TabBarModel = new TabBarModel()
  private taboptions: TabBarOptions [] = [
    new TabBarOptions(1, "All Rooms", $r('app.media.icon')),
    new TabBarOptions(2, "Living Room", $r('app.media.icon')),
    new TabBarOptions(3, "BedRoom", $r('app.media.icon')),
    new TabBarOptions(4, "BathRoom", $r('app.media.icon')),
    new TabBarOptions(5, "Dining Room", $r('app.media.icon')),
    new TabBarOptions(6, "Kitchen", $r('app.media.icon'))
  ]
  @State modelcard1: CardModel = new CardModel('Smart TV', 'Living Room')
  @State modelcard2: CardModel = new CardModel('AC', 'BedRoom')
  @State modelcard3: CardModel = new CardModel('Light', 'Dining Room')
  @State modelcard4: CardModel = new CardModel('Router', 'All Rooms')
  private sliderModel1: SliderModel = new SliderModel(SliderType.Continue)
  private sliderModel2: SliderModel = new SliderModel(SliderType.Continue)
  private sliderModel3: SliderModel = new SliderModel(SliderType.Continue)
  private sliderModel4: SliderModel = new SliderModel(SliderType.Continue)

  aboutToAppear() {
    this.topAppBar
      .setNavigationIcon(this.navigationIcon)
      .setTitleModel(this.title)
      .setOptions(this.options)
      .setBackgroundColor("#D3D3D3")
      .addNavigationListener(() => {
        console.log('Navigation icon clicked')
      })
      .addOptionListener((option: OptionMenu.Model) => {
        console.log('Option:: ' + option.getLabel())
        router.push({ uri: 'pages/profiles', })
      })

    this.tabBar
      .setTabBarType(TabBarType.SCROLLABLE)
      .setTabIconType(IconType.NONE)
      .setTabBarOptions(this.taboptions)

    this.modelcard1.setMediaIconPosition(MediaIconPosition.Top)
    this.modelcard1.setCardType(CardType.Elevated)
    this.modelcard1.setCardHeight(160)
    this.modelcard1.setCardWidth(160)
    this.modelcard1.setMediaIconWidth(60)
    this.modelcard1.setMediaIconHeight(60)
    this.modelcard1.setMediaIcon($r('app.media.television'))
    this.modelcard1.setTitleFontSize(22)
    this.modelcard1.setCardBackGroundColor(Color.White)

    this.modelcard2.setMediaIconPosition(MediaIconPosition.Top)
    this.modelcard2.setCardType(CardType.Elevated)
    this.modelcard2.setCardHeight(160)
    this.modelcard2.setCardWidth(160)
    this.modelcard2.setMediaIconWidth(60)
    this.modelcard2.setMediaIconHeight(60)
    this.modelcard2.setMediaIcon($r('app.media.ac'))
    this.modelcard2.setTitleFontSize(22)
    this.modelcard2.setCardBackGroundColor(Color.White)

    this.modelcard3.setMediaIconPosition(MediaIconPosition.Top)
    this.modelcard3.setCardType(CardType.Elevated)
    this.modelcard3.setCardHeight(160)
    this.modelcard3.setCardWidth(160)
    this.modelcard3.setMediaIconWidth(60)
    this.modelcard3.setMediaIconHeight(60)
    this.modelcard3.setMediaIcon($r('app.media.lightbulb'))
    this.modelcard3.setTitleFontSize(22)
    this.modelcard3.setCardBackGroundColor(Color.White)

    this.modelcard4.setMediaIconPosition(MediaIconPosition.Top)
    this.modelcard4.setCardType(CardType.Elevated)
    this.modelcard4.setCardHeight(160)
    this.modelcard4.setCardWidth(160)
    this.modelcard4.setMediaIconWidth(60)
    this.modelcard4.setMediaIconHeight(60)
    this.modelcard4.setMediaIcon($r('app.media.router'))
    this.modelcard4.setTitleFontSize(22)
    this.modelcard4.setCardBackGroundColor(Color.White)

    this.sliderModel1.setSliderStyle(SliderStyle.InSet)
    this.sliderModel1.setMin(144)
    this.sliderModel1.setMax(720)
    this.sliderModel1.setStep(1)
    this.sliderModel1.setCurrentValue(480)
    this.sliderModel1.setShowSteps(false)
    this.sliderModel1.setShowTips(true)
    this.sliderModel1.setTrackThickness(15)
    this.sliderModel1.setReverse(false)
    this.sliderModel1.setDirection(Axis.Horizontal)
    this.sliderModel1.setShowValue(true)
    this.sliderModel1.setShowMin(false)
    this.sliderModel1.setShowMax(false)
    this.sliderModel1.setBlockColor(Color.White)
    this.sliderModel1.setTrackColor("#D0D0D0")
    this.sliderModel1.setSelectedColor("#ff0477ff")

    this.sliderModel2.setSliderStyle(SliderStyle.InSet)
    this.sliderModel2.setMin(16)
    this.sliderModel2.setMax(30)
    this.sliderModel2.setStep(1)
    this.sliderModel2.setCurrentValue(23)
    this.sliderModel2.setShowSteps(false)
    this.sliderModel2.setShowTips(true)
    this.sliderModel2.setTrackThickness(15)
    this.sliderModel2.setReverse(false)
    this.sliderModel2.setDirection(Axis.Horizontal)
    this.sliderModel2.setShowValue(true)
    this.sliderModel2.setShowMin(false)
    this.sliderModel2.setShowMax(false)
    this.sliderModel2.setBlockColor(Color.White)
    this.sliderModel2.setTrackColor("#D0D0D0")
    this.sliderModel2.setSelectedColor("#ff0477ff")

    this.sliderModel3.setSliderStyle(SliderStyle.InSet)
    this.sliderModel3.setMin(0)
    this.sliderModel3.setMax(100)
    this.sliderModel3.setStep(1)
    this.sliderModel3.setCurrentValue(60)
    this.sliderModel3.setShowSteps(false)
    this.sliderModel3.setShowTips(true)
    this.sliderModel3.setTrackThickness(15)
    this.sliderModel3.setReverse(false)
    this.sliderModel3.setDirection(Axis.Horizontal)
    this.sliderModel3.setShowValue(true)
    this.sliderModel3.setShowMin(false)
    this.sliderModel3.setShowMax(false)
    this.sliderModel3.setBlockColor(Color.White)
    this.sliderModel3.setTrackColor("#D0D0D0")
    this.sliderModel3.setSelectedColor("#ff0477ff")

    this.sliderModel4.setSliderStyle(SliderStyle.InSet)
    this.sliderModel4.setMin(5)
    this.sliderModel4.setMax(80)
    this.sliderModel4.setStep(1)
    this.sliderModel4.setCurrentValue(40)
    this.sliderModel4.setShowSteps(false)
    this.sliderModel4.setShowTips(true)
    this.sliderModel4.setTrackThickness(15)
    this.sliderModel4.setReverse(false)
    this.sliderModel4.setDirection(Axis.Horizontal)
    this.sliderModel4.setShowValue(true)
    this.sliderModel4.setShowMin(false)
    this.sliderModel4.setShowMax(false)
    this.sliderModel4.setBlockColor(Color.White)
    this.sliderModel4.setTrackColor("#D0D0D0")
    this.sliderModel4.setSelectedColor("#ff0477ff")
  }

  private onSliderChange(value: number, mode: SliderChangeMode) {
    console.log("Value: " + value.toFixed(0) + ", Mode: " + mode)
  }

  build() {
    Column() {
      AppBar({ model: this.topAppBar })


      Row() {
        Image($r("app.media.searchicon")).width(30).height(30)
        TextArea({ placeholder: "Search" }).width(290)
      }.padding({ top: 15, bottom: 15 })

      TabBar({
        selectedTabId: 1,
        model: this.tabBar
      })


      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Column() {
          MaterialCard({
            model: $modelcard1,
          })
        }.height(180).width('50%')

        Column() {
          MaterialCard({
            model: $modelcard2,
          })
        }.height(180).width('50%')
      }.padding({ bottom: 5 })
      .width('95%')

      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Column() {
          MaterialCard({
            model: $modelcard3,
          })
        }.height(170).width('50%')

        Column() {
          MaterialCard({
            model: $modelcard4,
          })
        }.height(180).width('50%')
      }.padding({ bottom: 15 })
      .width('95%')

      Scroll(this.scroller) {
        Row({ space: 5 }) {
          if (this.modelcard1.getTogState()) {
            Column() {
              Text("Smart TV")
                .width('95%')
                .fontSize(22)
                .margin({ left: 10 })
                .fontColor(Color.Gray)
                .fontWeight(FontWeight.Bold)
                .fontFamily('calibri')
                .padding({ bottom: 10 })
              MaterialSlider({
                obj: this.sliderModel1,
                onSliderChange: this.onSliderChange,
                displayString: "Resolution : "
              })
            }
          }
          if (this.modelcard2.getTogState()) {
            Column() {
              Text("Air Conditioner")
                .width('95%')
                .fontSize(22)
                .margin({ left: 10 })
                .fontColor(Color.Gray)
                .fontWeight(FontWeight.Bold)
                .fontFamily('calibri')
                .padding({ bottom: 10 })
              MaterialSlider({
                obj: this.sliderModel2,
                onSliderChange: this.onSliderChange,
                displayString: "Temperature : "
              })
            }
          }
          if (this.modelcard3.getTogState()) {
            Column() {
              Text("Light")
                .width('95%')
                .fontSize(22)
                .margin({ left: 10 })
                .fontColor(Color.Gray)
                .fontWeight(FontWeight.Bold)
                .fontFamily('calibri')
                .padding({ bottom: 10 })
              MaterialSlider({
                obj: this.sliderModel3,
                onSliderChange: this.onSliderChange,
                displayString: "Brightness : "
              })
            }
          }
          if (this.modelcard4.getTogState()) {
            Column() {
              Text("Router")
                .width('95%')
                .fontSize(22)
                .margin({ left: 10 })
                .fontColor(Color.Gray)
                .fontWeight(FontWeight.Bold)
                .fontFamily('calibri')
                .padding({ bottom: 10 })
              MaterialSlider({
                obj: this.sliderModel4,
                onSliderChange: this.onSliderChange,
                displayString: "Internet Speed : "
              })
            }
          }
        }.height(115).width('100%')
      }.scrollable(ScrollDirection.Vertical).scrollBar(BarState.On)

      Row() {
        bottomBar()
      }.alignItems(VerticalAlign.Bottom).height(105)
    }.width('100%')
  }
}