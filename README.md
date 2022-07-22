# Smart Home

一UI design for Smart Home in OpenHarmony.

## Smart Home Design :
![shdemo](https://user-images.githubusercontent.com/68344077/180381526-af4c644b-3947-4a32-a5a5-8d28bf808705.gif)

## Features:
1. It integrates all the home appliances and provides a common platform to regulate the parameters of respective devices.
2. It also provides a common place for all device users.
3. It provides for the modification of user profile, account removal, etc.

### Home Page
![image](https://user-images.githubusercontent.com/68344077/180381346-1d5b6876-3bd3-4523-91c1-e10e4537f7f2.png)

This page contains a search Bar along with tabs for separate rooms. It displays all the appliances at one place followed by sliders to regulate device parameters. The bottom bar has several features such as settings, feedback, help, etc.

### Profiles Page
![image](https://user-images.githubusercontent.com/68344077/180381421-0c23c3f7-b883-447b-8804-d3a6ccea6b01.png)

This page contains all the profiles with toggle button to set current user, edit button which helps to navigate to the edit profile page and remove button to remove account.

### Edit User Page
![image](https://user-images.githubusercontent.com/68344077/180381484-48bb7d97-518a-4d90-a697-61d2ed103710.png)

This page enables to edit the user information such as name, phone number and email.

## Usage Instructions
1. Code for Top Bar
```
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
```

2. Code for Tab Bar
```
this.tabBar  
  .setTabBarType(TabBarType.SCROLLABLE)  
  .setTabIconType(IconType.NONE)  
  .setTabBarOptions(this.taboptions)
```

3. Code for Appliance Cards
```
this.modelcard1.setMediaIconPosition(MediaIconPosition.Top)  
this.modelcard1.setCardType(CardType.Elevated)  
this.modelcard1.setCardHeight(160)  
this.modelcard1.setCardWidth(160)  
this.modelcard1.setMediaIconWidth(60)  
this.modelcard1.setMediaIconHeight(60)  
this.modelcard1.setMediaIcon($r('app.media.television'))  
this.modelcard1.setTitleFontSize(22)  
this.modelcard1.setCardBackGroundColor(Color.White)
```

4. Code for Appliance Parameter Sliders
```
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
```

5. Code for Bottom Bar
```
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
```

6. Code for Profile Cards
```
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
```

7. Code for Edit User Text fields
```
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
```

## Compatibility

Supports OpenHarmony API version 9

## Reference:

Design by : Suvam Paul
