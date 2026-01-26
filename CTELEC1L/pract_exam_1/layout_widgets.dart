import 'package:flutter/material.dart';

// import for the microsoft icons (https://github.com/microsoft/fluentui-system-icons)
import 'package:fluentui_system_icons/fluentui_system_icons.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Screen width detection (for responsiveness)
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1100;

    double sidebarWidth = 68;

    // For the classes section
    int gridColumns = isMobile
        ? 1
        : isTablet
            ? 2
            : 3;

    // Left sidebar items. The boolean values are for when the tab in the left is selected or not, used in colors. 'Teams' are currently selected
    final List<List<dynamic>> leftSideBarMenu = [
      [FluentIcons.people_team_24_filled, "Teams", true],
      [FluentIcons.alert_24_regular, "Activity", false],
      [FluentIcons.chat_24_regular, "Chat", false],
      [FluentIcons.backpack_24_regular, "Assignments", false],
      [FluentIcons.calendar_24_regular, "Calendar", false],
      [FluentIcons.call_24_regular, "Calls", false],
      [FluentIcons.cloud_24_regular, "OneDrive", false],
      [FluentIcons.board_24_regular, "Viva Engage", false],
      [FluentIcons.more_horizontal_24_regular, "", false],
      [FluentIcons.apps_24_regular, "Apps", false],
    ];

    // For the cards in the main content
    final List<List<dynamic>> classesCards = [
      ['assets/images/0001.png', "RFO_INF235_CTINASSL INFORMATION ASSURANCE AND SECURITY 22526"],
      ['assets/images/0002.png', "JCB_INF235_CTELEC1L_IT_Elective_1"],
      ['assets/images/0003.png', "ODL_INF235_CTELEC2L_ : IT ELECTIVE 2"],
      ['assets/images/0004.png', "EMA_CTSYSADD_INF235"],
      ['assets/images/0005.png', "ODL_INF235_CCINTHCI_INTRODUCTION TO HUMAN-COMPUTER INTERACTION"],
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          
          // Left Sidebar
          // Stack was used here kase ayaw makipagsundo nung purple-ish selected color
          Stack(
            children: [
              Container(
                width: sidebarWidth,
                color: Color(0xFFF3F2F1),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(leftSideBarMenu.length, (index) {
                            bool isSelected = leftSideBarMenu[index][2];
                            return Container(
                              width: sidebarWidth,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected ? Color(0xFFE8E8F5) : Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    leftSideBarMenu[index][0],
                                    size: 24,
                                    color: isSelected ? Color(0xFF6264A7) : Color(0xFF424242),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    leftSideBarMenu[index][1],
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: isSelected ? Color(0xFF6264A7) : Color(0xFF424242),
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Selected indicator line (manually coded kase ang sakit sa ulo)
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 3,
                  height: 60,
                  color: Color(0xFF6264A7),
                ),
              ),
            ],
          ),

          // Main Content
          Expanded(
            child: Column(
              children: [

                // Header
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFEDEBE9), width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Teams",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF252423),
                        ),
                      ),
                      Row(
                        children: [
                          if (!isMobile)
                            IconButton(
                              icon: Icon(FluentIcons.more_horizontal_24_regular, color: Color(0xFF424242)),
                              onPressed: () {},
                              padding: EdgeInsets.all(8),
                              constraints: BoxConstraints(),
                            ),
                          if (!isMobile) SizedBox(width: 4),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF8A8886), width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            icon: Icon(FluentIcons.people_add_24_regular, size: 16, color: Color(0xFF252423)),
                            label: Text(
                              "Join or create team",
                              style: TextStyle(
                                color: Color(0xFF252423),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Body
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Classes Section
                          Row(
                            children: const [
                              Icon(FluentIcons.chevron_down_24_regular, size: 16, color: Color(0xFF424242)),
                              SizedBox(width: 8),
                              Text(
                                "Classes",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF252423),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Grid
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: classesCards.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: gridColumns,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: isMobile ? 1.2 : 2.5,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFEDEBE9), width: 1),
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: Image.asset(
                                            classesCards[index][0],
                                            height: 56,
                                            width: 56,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text(
                                            classesCards[index][1],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Color(0xFF252423),
                                              height: 1.4,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(FluentIcons.more_horizontal_24_regular, size: 20, color: Color(0xFF424242)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: const [
                                        Icon(FluentIcons.document_24_regular, size: 20, color: Color(0xFF424242)),
                                        SizedBox(width: 16),
                                        Icon(FluentIcons.backpack_24_regular, size: 20, color: Color(0xFF424242)),
                                        SizedBox(width: 16),
                                        Icon(FluentIcons.notebook_24_regular, size: 20, color: Color(0xFF424242)),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 24),

                          // Teams Section
                          Row(
                            children: const [
                              Icon(FluentIcons.chevron_right_24_regular, size: 16, color: Color(0xFF424242)),
                              SizedBox(width: 8),
                              Text(
                                "Teams",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF252423),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}