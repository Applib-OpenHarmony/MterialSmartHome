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

import { TabBarOptions } from './TabBarOptions';
import { TabBarModel } from './TabBarModel';
import { TabBarType } from './TabBarType';
import { IconType } from './IconType';

@Component
export struct TabBar {
  @State private model: TabBarModel = undefined
  @State private selectedTabId: number = undefined
  private onSelect: ((id: number) => void) = null

  aboutToAppear() {
    if (this.model == null || this.model == undefined) {
      return
    }

    if (this.selectedTabId == null || this.selectedTabId == undefined) {
      this.selectedTabId = 1
    }

    this.model.buildModels()
  }

  private onTabSelect(id) {
    if (this.onSelect != null) {
      this.onSelect(id);
    }
  }

  build() {
    if (this.model.getBarType() == TabBarType.FIXED) {
      Row() {
        ForEach(
        this.model.getModels(),
          (item) => {
            ListItem() {
              Tab({
                model: item,
                selectedTabId: $selectedTabId,
                onSelect: (id) => this.onTabSelect(id)
              })
            }
          },
          item => item.getTabId()
        )
      }.width('100%')
    }
    else if (this.model.getBarType() == TabBarType.SCROLLABLE) {
      List() {
        ForEach(
        this.model.getModels(),
          (item) => {
            ListItem() {
              Tab({
                model: item,
                selectedTabId: $selectedTabId,
                onSelect: (id) => this.onTabSelect(id)
              })
            }
          },
          item => item.getTabId()
        )
      }.listDirection(Axis.Horizontal)
      .height(this.model.getIconType() == IconType.TOP ? '70vp' : '50vp')
    }
  }
}

@Component
export struct Tab {
  @Link private selectedTabId: number
  @State private model: TabBarModel = undefined
  private onSelect: ((id: number) => void) = null

  aboutToAppear() {
    if (this.model == null || this.model == undefined) {
      return
    }
  }

  private onClick() {
    this.selectedTabId = this.model.getTabId()

    if (this.onSelect != null) {
      this.onSelect(this.model.getTabId());
    }
  }

  build() {
    if (this.model != null && this.model != undefined) {
      Column() {
        if (this.model.getIconType() == IconType.NONE) {

          Text(this.model.getTabName())
            .maxLines(2)
            .fontSize('16fp')
            .textAlign(TextAlign.Center)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .backgroundColor(this.model.getTabBackgroundColor())
            .height(this.selectedTabId == this.model.getTabId() ? '44vp' : '46vp')
            .fontWeight(this.selectedTabId == this.model.getTabId() ? FontWeight.Bolder : FontWeight.Normal)
            .fontColor(this.selectedTabId == this.model.getTabId() ? this.model.getSelectedTabColor() : this.model.getNonSelectedTabColor())

        } else if (this.model.getIconType() == IconType.TOP) {

          Image(this.model.getTabIcon()).width('24vp').height('24vp').margin({ top: '8vp' })

          Text(this.model.getTabName())
            .maxLines(2)
            .fontSize('16fp')
            .textAlign(TextAlign.Center)
            .margin({ top: '8vp', bottom: this.selectedTabId == this.model.getTabId() ? '2vp' : '8vp' })
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontWeight(this.selectedTabId == this.model.getTabId() ? FontWeight.Bolder : FontWeight.Normal)
            .fontColor(this.selectedTabId == this.model.getTabId() ? this.model.getSelectedTabColor() : this.model.getNonSelectedTabColor())

        } else if (this.model.getIconType() == IconType.LEADING) {

          Row() {
            Image(this.model.getTabIcon()).width('20vp').height('20vp')
              .margin(this.model.getBarType() == TabBarType.SCROLLABLE ? { left: '-25vp' } : { left: '-20vp' })

            Text(this.model.getTabName())
              .maxLines(2)
              .fontSize('16fp')
              .textAlign(TextAlign.Center)
              .margin({ left: '-20vp', right: '2vp' })
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .height(this.selectedTabId == this.model.getTabId() ? '44vp' : '46vp')
              .fontWeight(this.selectedTabId == this.model.getTabId() ? FontWeight.Bolder : FontWeight.Normal)
              .fontColor(this.selectedTabId == this.model.getTabId() ? this.model.getSelectedTabColor() : this.model.getNonSelectedTabColor())
          }
          .width(this.model.getTabWidth())
          .backgroundColor(this.model.getTabBackgroundColor())

        }

        Shape() {
          Rect()
            .width('100%')
            .height(this.selectedTabId == this.model.getTabId() ? '4vp' : '2vp')
        }
        .fill(this.selectedTabId == this.model.getTabId() ? this.model.getSelectedTabColor() : this.model.getRectColor())

      }
      .width(this.model.getTabWidth())
      .onClick(() => this.onClick())
    }
  }
}

export { TabBarModel } from './TabBarModel';

export { TabBarOptions } from './TabBarOptions';

export { TabBarType } from './TabBarType';

export { IconType } from './IconType';
