class Books {
  String name = "";
  String book;
  double price;
  String sammary;
  Books({required this.book, required this.price, required this.sammary,required this.name});
}

List allbook = [
  Books(
    name:"أرض زيكولا",
    book: "assets/img/OIP (1).jpeg",
    price: 122.99,
    sammary:
        """بطل هذه الرواية هو خالد شاب ذو 28 عاما من قرية البهوفريك يتقدم لخطبة حبيبته للمرة الثامنة ويقبل بالرفض من طرف والدها بداعي أنه يريد لابنته شابا غير عادي، يحاول بعدها خالد القيام بمغامرة يتسنى له من خلالها الوصول لشيء يرضي باله. يقرر القيام برحلة في سرداب فوريك المتواجد بالقرية ذلك السرداب الذي تحوم حوله إشاعات وحقائق عديدة، منها أنه كان المكان الأخير الذي زاره والدا خالد. فيلتجئ لجده ليستدعي هذا الأخير صديقا له ويمنح خالد كتابا قديما لشخص سبق أن زار السرداب إلا أن ذلك الكتاب غير مكتمل. يدخل خالد السرداب في ليلة مقمرة وبعد مسيرة طويلة يحدث انهيار به، بعد نجاة خالد يجد نفسه في صحراء قاحلة بها شخصان يدلانه عن مدينة قريبة كانت تلك أرض زيكولا والتي كانت تعرف في ذلك اليوم احتفالا بيومها الخاص يوم الزيكولا، يدخل خالد المدينة ويتعرف على يامن وصديقه إياد اللذان يخبرانه بقوانين زيكولا وكيف يتعامل الناس بوحدات الذكاء بدل المال وكيف يذبح أفقر(أغبى) من بالمدينة في يوم الزيكولا بعد اختيار لعبة الزيكولا له .وعندما يقرّر الخروج يخبرونه بأن الباب الذي دخل منه قد أغلق ولن يفتح إلا في السنة القادمة يوم الاحتفال، يتعرف بعد ذلك خالد على الطبيبة أسيل التي تساعده في باقي رحلته في البحث عن كتاب علم خالد بأنه أغلى كتاب بيع في أرض زيكولا ويتحدث عن وهم سمي بسرداب فوريك وهذا الكتاب كان مع شخص قدم المدينة منذ عشرين عاما، يعرف بعدها أن صاحب الكتاب كان والده، فبدأ خالد العمل رفقة صديقه يامن لجني المزيد من وحدات الذكاء التي يتطلبها الكتاب، والبحث كذلك عن صاحب الكتاب رفقة أسيل، ليتبين في الأخير أن مالك الكتاب هو أخو خالد والذي تحصل عليه بعد أن قتل والده من أجل أن يرثه.
      
      تطلب الكتاب الكثير من وحدات الذكاء خاصة أن أخاه كان كثير الطمع والاستغلال.بعدها يجد خالد في الكتاب لغز لم يستطع حله إلا بمساعدة الطبيبة أسيل التي كانت تمتلك ثروة من الذكاء. وبعدما وجد باب السرداب للعودة كان لا بد من إيجاد طريقة للوصول إليه بعدما اكتشف أن الباب يقع خارج سور زيكولا وليس داخله. فوضع خطة كالتالي: سيحفر نفق في أحد البيوت القريبة من السور حيث سيعطي للخادم الذي يحرسه 200 وحدة ذكاء والعمال الذين سيحفرون النفق 300 وحدة ذكاء، على أن يتمموا الحفر في ضرف 20 يوما. وهو سيعمل في تلك الفترة لكي يستعيد وحداته، لكن المفاجأة كانت ولادة ابن الحاكم في شهره السابع فقط وخلالها تم اعتقال خالد على أنه ضمن الأكثر فقرا في زيكولا وبعد أن فحصته الطبيبة أسيل إلى جانب العديد من المعتقلين الاخرين تبين أنه ضمن الثلاثة الأكثر فقرا.وبعدها أحيل على لعبة الزيكولا التي لم ينجح فيها وتم الحكم عليه بالذبح لكن الطبيبة كانت قد منحته من ذكائها الكثير دون علمه لأنها كانت تحبه ولم ترد موته، ليتم بعدها إعلان العفو عن خالد لكونه غني واعتبار الطبيبة أسيل خائنة. وبعد مساعدة صديقيه تمكن خالد بالفعل من ولوج النفق المؤدي إلى سرداب فوريك وعاد بلده. في حين هربت الطبيبة من أرض زيكولا""",
  ),
  Books(
    name:"الجريمه والعقاب",
      book: "assets/img/download (1).jpeg",
      price: 100.99,
      sammary:
          """ دور أحداث الرواية في مدينة سانت بطرسبرغ في روسيا، وتتحدث عن جريمة قتل يرتكبها شاب يدعى “روديون راسكولنيكوف”، ويبلغ من العمر 23 عامًا. يعيش راسكولنيكوف حالة مأساوية من الفقر داخل غرفة صغيرة، ويخطط لقتل عجوز ثرية تدعى “إيلينا” التي جمعت ثروتها من الربا واستغلال الضعفاء. يقوم راسكولنيكوف بقتل العجوز بفأس كبير، ولكن الصدفة تلعب دورها فينصدم بقدوم أختها في نفس اللحظة فيقتلها هي أيضًا. يخفي راسكولنيكوف أثار الجريمة وينظف ثيابه من الدماء ويخفي الأشياء التي سرقها، لكنه يصاب بالحمى، وتسيطر عليه حالة من الخوف والقلق، وتنتشر حادثة القتل بين الناس، فيكثر الخروج إلى شوارع المدينة حتى لا يثير شكوك أحد حوله. يشك المحقق “بورفيري” براسكولنيكوف، وذلك من خلال تحليله العميق لحالته النفسية المتدهورة. يتعلق راسكولنيكوف بسونيا، وتتطور علاقتهما بعد أن تخبرها سونيا بأنه القاتل، ويعترف راسكولنيكوف للشرطة بالجريمتين، ويحكم عليه بالسجن لمدة 8 سنوات مع الأعمال الشاقة. """),
  Books(
    name:"قوة الآن",
      book: "assets/img/download (2).jpeg",
      price: 44.99,
      sammary:
          """ قوة الآن" هو كتاب يركز على فهم أهمية الحاضر والعيش في لحظة الآن. يقوم المؤلف بتسليط الضوء على فكرة أن السعادة والتحول الشخصي تأتي من خلال التركيز على اللحظة الحالية دون التشتت في الماضي أو القلق بشأن المستقبل. يستند تولي إلى مفهوم الوعي وكيف يمكن أن يؤثر التركيز على اللحظة الحالية إيجابًا على جودة حياتنا.

الكتاب يقدم تمارين عملية ونصائح لتحسين الوعي والاستمتاع بالحياة. يشدد تولي على أهمية التخلص من الأفكار السلبية والتحكم في العقل لتحقيق حياة أكثر سعادة وتوازنًا.

الفلسفة الرئيسية في "قوة الآن" هي أن الوعي باللحظة الحالية يمكن أن يفتح أبواب السعادة والتحول الروحي. """),
  Books(
    name:"لغز الحياة",
      book: "assets/img/download (3).jpeg",
      price: 56.99,
      sammary:
          """ يتحدث الكتاب عن بداية الخلق والإعجاز العلمي الموجود في كل كائن، بداية من أصغر شيء وهو الفيروسات إلى أضخم شيء مروراً بالمجرات. ينتقد الكاتب نظرية العالم داروين حول النشوء والارتقاء والانتخاب الطبيعي، ويتحدث أيضاً عن نظريات علم النفس الرائدة مثل نظريات فرويد. كما يتطرق الكتاب إلى عوالم أخرى مثل علم النمل وعالم النحل وجسم الإنسان."""),
  Books(
    name:"يوتوبيا",
      book: "assets/img/download.jpeg",
      price: 45.99,
      sammary:
          """ دور أحداث الرواية في مدينة مُتخيّلة تُدعى يوتوبيا، وتقع حسب وصْف الكاتب على ساحل مصر الشمالي، تضمُّ هذه المدينة أثرياء مصر، إذ تجمَّع فيها أصحاب الثروة والنفوذ، وتوفرت فيها جميع أشكال الرفاهية والنعيم لهؤلاء السكان، وقد بالغ الناس في الغوْص في هذه الرفاهيات إلى درجة الانحلال والتفسُّخ، وانقسم المجتمع المصري بذلك إلى طبقتين1 ختلف الحياة في مدينة يوتوبيا عن الحياة خارجها، فهي مدينة مُحصّنة تحيط بها أسوار عالية، ولها حرس من المارينز يمنعون دخول الغرباء، وخطِّطَت المدينة بدقة فائقة، حتى المساجد والمعابد والكنائس كان لها نصيب من العناية، ولكنْ لم يعُد يدخلها إلا كبار السن، كما يوجد فيها منطقة للقصور التي يملكها كبار الأغنياء في يوتوبيا، مثل مراد بك  """),
  Books(
    name:"العادات الزرية",
      book: "assets/img/OIP (2).jpeg",
      price: 23.99,
      sammary:
          """ تحدث الكتاب عن كيفية بناء العادات المفيدة للمرء والتي تلازمه طيلة حياته، والتي تكون سببًا في تحقيق نجاحٍ كبيرٍ في النهاية. يوضح الكتاب أن العادة هي سلوك لعددٍ معينٍ من المرات إلى أن تصبح سلوكًا أساسيًّا، وأنه يجب على المرء أن يحدد وقتًا معينًا ومكانًا معينًا يبدأ منه العادة ليستطيع القيام بها حقًا. كما يوضح الكتاب أن العادات الذرية هي ممارسة أو روتين منتظم ليس فقط صغيرًا وسهلٌ القيام به، ولكنه أيضًا مصدرُ قوة لا تصدّق، وأحد مكونات نظام النّمو المركب. يتكون بناء العادة من مرحلة الإشارة ومرحلة التوق ومرحلة الاستجابة وأخيرًا المكافأة. يوضح الكتاب أن الحكم فيه واضحة وجلية ليسهل على الجميع فهمها وتطبيقها في كل مناحي الحياة. """),
  Books(
    name:" العادات السبع للناس الأكثر فاعلية",
      book: "assets/img/OIP.jpeg",
      price: 76.99,
      sammary:
          """ تحدث الكتاب عن سبع عادات يمكن اكتسابها لتحقيق الفعالية الشخصية والنجاح في الحياة. العادة الأولى هي “كن مبادرًا”، والعادة الثانية هي “ابدأ بالهدف في العقل”، والعادة الثالثة هي “ابدأ بالأهم”، والعادة الرابعة هي “فكر بالفوز للجميع”، والعادة الخامسة هي “ابحث عن الفهم ثم الفهم”، والعادة السادسة هي “ابحث عن التفاهم”، والعادة السابعة هي “استشر الآخرين”. يوضح الكتاب أن العادات السبع هي عادات فعالة تساعد على تحقيق النجاح في الحياة الشخصية والمهنية. """),
  Books(
    name:"الأب الغني والأب الفقير",
      book: "assets/img/rich.jpeg",
      price: 97.99,
      sammary:
          """ حكي الكتاب قصة طفولة الكاتب ونصائح والده الأستاذ الجامعي ووالد صديقه مايك، رجل الأعمال العصامي، ويسرد طفولة الكاتب وهو يتعلم كيف يحصل على المال ويكتسبه، مع مقارنة دائمه ما بين وضعي والده الأكاديمي الجامعي، ووالد صديقه العملي التجاري. يحاول الكاتب أن يبرز أسلوب وعادات الأثرياء في التعامل مع الحياة عموماً والتي تصب جميعها في خدمة استثمار الأموال وزيادة الادخار. يعتبر كتاب “الأب الغني والأب الفقير” من أنجح أعمال الكاتب الأمريكي روبرت كيوساكي، حيث يتطرق الكتاب لأهمية الإستقلال المالي وبناء الثروة. """),
];
