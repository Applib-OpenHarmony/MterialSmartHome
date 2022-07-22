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

import { BottomBar, FabPosition, NavigationIcon, FloatingActionButton, OptionMenu } from "@ohos/material-bottombar"
import prompt from '@system.prompt';

@Component
export struct bottomBar {
  private model: BottomBar.Model = new BottomBar.Model()
  private navigationIcon = new NavigationIcon.Model()
    .setIcon($r('app.media.homeicon'))
  private Icon2 = new NavigationIcon.Model()
    .setIcon($r('app.media.router'))
  private Icon3 = new NavigationIcon.Model()
    .setIcon($r('app.media.routines'))
  private floatingActionButton = new FloatingActionButton.Model()
    .setFabPosition(FabPosition.Center)
  private options = [
    new OptionMenu.Model(1)
      .setIcon($r('app.media.notification'))
      .setText('search'),
    new OptionMenu.Model(2)
      .setIcon($r('app.media.notification'))
      .setText('Settings'),
    new OptionMenu.Model(3)
      .setIcon($r('app.media.notification'))
      .setText('Send Feedback'),
    new OptionMenu.Model(4)
      .setIcon($r('app.media.notification'))
      .setText('Help')]

  private navigationIconClick() {
    prompt.showToast({
      message: 'Home'
    })
  }

  private icon2Click() {
    prompt.showToast({
      message: 'Devices'
    })
  }

  private fabClick() {
    prompt.showToast({
      message: 'Floating Action Button'
    })
  }

  private icon3Click() {
    prompt.showToast({
      message: 'Routines'
    })
  }

  private optionClick(option: OptionMenu.Model) {
    prompt.showToast({
      message: 'Notification:: ' + option.getText()
    })
  }

  aboutToAppear() {
    this.model
      .setFabPosition(FabPosition.Center)
      .setNavigationIcon(this.navigationIcon)
      .setIcon2(this.Icon2)
      .setIcon3(this.Icon3)
      .setFabModel(this.floatingActionButton)
      .setOptions(this.options)
      .setBackgroundColor("#D3D3D3")
      .addNavigationListener(this.navigationIconClick)
      .addIcon2Listener(this.icon2Click)
      .addIcon3Listener(this.icon3Click)
      .addFabListener(this.fabClick)
      .addOptionListener(this.optionClick)
  }

  build() {

    Column() {
      BottomBar({ model: this.model,
      })
    }
  }
}