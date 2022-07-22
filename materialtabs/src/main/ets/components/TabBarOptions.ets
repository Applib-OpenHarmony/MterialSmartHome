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

export class TabBarOptions {
  private id: number = -1
  private name: string | Resource = ""
  private icon: Resource = null

  constructor(id: number, name: string | Resource, icon: Resource) {
    this.id = id
    this.name = name
    this.icon = icon
  }

  getId(): number{
    return this.id
  }

  getName(): string | Resource{
    return this.name
  }

  getIcon(): Resource{
    return this.icon
  }
}
