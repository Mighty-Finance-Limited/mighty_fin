import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_fin/utils/constants/colors.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Terms and Conditions",
          style: GoogleFonts.montserrat(
            color: textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        // decoration: const BoxDecoration(color: Colors.amber),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                side: WidgetStateProperty.all(
                  const BorderSide(
                    width: 2,
                    color: secondaryBtnPrimary,
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Disagree",
                style: GoogleFonts.montserrat(
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  // fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  secondaryBtnPrimary,
                ),
              ),
              // onPressed: () => Navigator.pushNamed(context,"/login"),
              onPressed: (){},
              child: Text(
                "Accept",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  // fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
          children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 70,
              width: 100,
              decoration: const BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: AssetImage("assets/logo/purple-logo.png"),
                    fit: BoxFit.fitWidth,
                    scale: 1.0),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 6),
          child: Text('Dear Customer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                color: textPrimary,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Important Reminder: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    'Please read the following terms and conditions carefully before using this service.',
                    children: [
                      TextSpan(
                          text: " By accessing or using "
                              "the application, you agree to be bound by these"
                              " terms and conditions. If you do not agree with any part"
                              " of these terms, you should not use the application \n\n")
                    ]),
                TextSpan(
                    text: '1. Definitions\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textAmber,
                    )),
                TextSpan(
                    text: '1.1. The Service: ',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text:
                    'MightyFin provides FlashLoan services to users ("Customer" or "User" or "Account Holder") through its app or website.\n'),
                TextSpan(
                  text: '1.2. Customer/User/Account Holder: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    'Refers to individuals who have registered and use the FlashLoan services provided by MightyFin.\n\n'),
                TextSpan(
                  text: '2. Privacy Policy\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '2.1. By using the Service, you agree to the Privacy Policy outlined by MightyFin. Your consent to the collection and use of personal information is essential for providing the Service.\n\n'),
                TextSpan(
                  text: '3. Account Information\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '3.1. You must provide accurate and complete information about yourself, including emergency contact details, and update this information as necessary. You are responsible for any third-party information provided to us.\n\n'),
                TextSpan(
                  text: '4. User Undertakings\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '4.1. Users agree to repay all amounts due to MightyFin in connection with loans or services provided.\n'),
                TextSpan(
                    text:
                    '4.2. Users must not engage in prohibited activities, including illegal or fraudulent actions, harassment, or misuse of the app.\n\n'),
                TextSpan(
                  text: '5. Finance and Service Charges\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '5.1. Users agree to pay all applicable charges, fees, and costs associated with the services provided by MightyFin.\n\n'),
                TextSpan(
                  text: '6. Tax\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '6.1. Users are responsible for any taxes related to the services provided by MightyFin.\n\n'),
                TextSpan(
                    text: '7. Payment Default or Breach\n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                    '7.1. Failure to comply with terms may result in cancellation of services and immediate repayment of outstanding balances.\n\n'),
                TextSpan(
                  text: '8. Indemnity and Recovery of Costs\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '8.1. Users agree to indemnify MightyFin against any claims or losses arising from the use of the service.\n\n'),
                TextSpan(
                  text: '9. Service License\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '9.1. Users are granted a limited, non-transferable license to use the service and associated software.\n\n'),
                TextSpan(
                  text: '10. Service Discontinuation\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '10.1. MightyFin reserves the right to terminate or suspend access to the service without notice.\n\n'),
                TextSpan(
                  text: '11. Service Warranty\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '11.1. The service is provided "as is" without warranties, and MightyFin and its suppliers are not liable for any damages incurred.\n\n'),
                TextSpan(
                  text: '12. Modifications to Terms\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '12.1. MightyFin may modify these terms without notice, and users are bound by the latest version of the terms.\n\n'),
                TextSpan(
                  text: '13. Compliance with Local Laws\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '13.1. Users must abide by local laws and regulations while using the service.\n\n'),
                TextSpan(
                  text: '14. Force Majeure and Immunity\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '14.1. MightyFin is not liable for interruptions due to force majeure or circumstances beyond its control.\n\n'),
                TextSpan(
                  text: '15. Intellectual Property Rights\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '15.1. Users must respect intellectual property rights related to the service provided by MightyFin.\n\n'),
                TextSpan(
                  text: '16. User Declaration\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '16.1. Users agree to comply with MightyFin\'s requirements and directions and declare the lawful use of funds and accounts.\n\n'),
                TextSpan(
                  text: '17. Miscellaneous Terms\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textAmber,
                  ),
                ),
                TextSpan(
                    text:
                    '17.1. Invalidity of any provision does not affect the remaining terms, and disputes are subject to the jurisdiction specified in the agreement.\n\n'),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}