import 'package:flutter/material.dart';
import '../../../../../core/utilities/component/customeappbarSidebar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
          child: ListView(
            children: [
              // AppBar
              CustomeAppbarSidebar(texxt: "نبذه عننا"),
              SizedBox(height: screenSize.height * 0.02),

              // Section: نبذة عنا
              Text("نبذة عنا:", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: screenSize.width * 0.05,),),
              SizedBox(height: screenSize.height * 0.01),
              Text("شركة البرنس للنقل والرحلات هي إحدى الشركات الرائدة في مجال النقل الجماعي والسياحي في مصر، حيث نفخر بتقديم خدمات نقل متميزة تلبي احتياجات الشركات والأفراد على حد سواء. تأسست الشركة بهدف توفير حلول نقل موثوقة ومريحة، ونعمل بجد لضمان تجربة سفر آمنة وممتعة لكل عملائنا.", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: screenSize.width * 0.035,),),

              SizedBox(height: screenSize.height * 0.02),

              // Section: خدماتنا
              Text("خدماتنا", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: screenSize.width * 0.05,),),
              SizedBox(height: screenSize.height * 0.01),
              Text("نمتلك أسطولاً حديثاً من الأتوبيسات والسيارات المجهزة بأحدث وسائل الراحة والأمان، مما يجعلنا الخيار الأمثل لنقل موظفي الشركات والمؤسسات إلى مقرات عملهم بكفاءة وفي المواعيد المحددة. سواء كنت تحتاج إلى نقل يومي للموظفين أو تنظيم رحلات خاصة للشركات، فإننا نضمن الالتزام والجودة في كل خطوة.", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: screenSize.width * 0.035,),),
              SizedBox(height: screenSize.height * 0.02),
              Text("بالإضافة إلى ذلك، نقدم خدمات الرحلات السياحية الداخلية والخارجية، حيث ننظم جولات سياحية إلى أجمل المعالم في مصر وخارجها، مع توفير تجربة مريحة ومصممة بعناية لتلبية تطلعات المسافرين.", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: screenSize.width * 0.035,),),

              SizedBox(height: screenSize.height * 0.02),
              // Section: لماذا تختار البرنس؟
              Text("لماذا تختار البرنس؟", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: screenSize.width * 0.05,),),
              SizedBox(height: screenSize.height * 0.01),
              Text(
                """
• أسطول حديث ومتنوع: أتوبيسات وسيارات مجهزة بأنظمة تكييف متطورة ومقاعد مريحة
• سائقون محترفون: فريق من السائقين المدربين ذوي الخبرة لضمان رحلة آمنة وسلسة.
• التزام بالمواعيد: ندرك أهمية الوقت، لذا نضمن الوصول في الوقت المحدد دائماً.
• خدمة عملاء متميزة: فريق دعم متاح على مدار الساعة للإجابة على استفساراتك وتلبية احتياجاتك.
                """, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: screenSize.width * 0.035,),),


              Text("رؤيتنا", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: screenSize.width * 0.05,),),
              Text("نسعى لأن نكون الخيار الأول في مصر والمنطقة لخدمات النقل الجماعي والرحلات السياحية، من خلال تقديم خدمات مبتكرة ومستدامة تركز على راحة العميل وسعادته.مع شركة البرنس، رحلتك تبدأ بثقة وتنتهي برضا. تواصلوا معنا اليوم لتجربة نقل لا مثيل لها!", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: screenSize.width * 0.035,),),
              SizedBox(height: screenSize.height*0.03,)
            ],
          ),
        ),
      ),
    );
  }
}
