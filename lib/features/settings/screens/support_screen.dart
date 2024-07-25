import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_fin/features/authentication/blocs/auth_bloc.dart';
import 'package:mighty_fin/features/dashboard/dashboard.dart';
import 'package:mighty_fin/features/settings/widgets/widgets.dart';
import 'package:mighty_fin/utils/constants/strings.dart';
import 'package:mighty_fin/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final _supportFormKey = GlobalKey<FormState>();
  bool _hasCallSupport = false;
  Future<void>? _launched;
  final String _phone = '0950082577';

  //
  // @override
  // void initState() {
  //   super.initState();
  //   // Check for phone call support.
  //   canLaunchUrl(Uri(scheme: 'tel', path: _phone)).then((bool result) {
  //     setState(() {
  //       _hasCallSupport = result;
  //     });
  //   });
  // }

  // _makingPhoneCall() async {
  //   var url = Uri.parse("tel:$_phone");
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomCircleBackBtnWidget(),
        title: Text(
          "Support",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: textPrimary,
          ),
        ),
        iconTheme: const IconThemeData(
          size: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const CustomHeadingWidget(text: "Submit your issue"),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text.rich(
                    TextSpan(
                      text:
                          "We are here to help! Submit any challenges or questions using the form"
                          " below for prompt assistance from our support team.\n\n"
                          "Hi ${state.user.fname} ${state.user.lname}, please submit your complaint or issue to create a ticket.",
                    ),
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: textPrimary),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Form(
            key: _supportFormKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                autofocus: true,
                maxLines: 6,
                minLines: 2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          CustomLongBtnWidget(
            btnText: "Submit",
            bgColor: secondaryBtnAmber,
            onPressed: () {},
          ),
          const CustomHeadingWidget(
            text: "Contact info",
            textColor: textPrimary,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text.rich(
              const TextSpan(
                text: ConstantStrings.supportParagraph2,
              ),
              style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: textPrimary),
            ),
          ),
          SupportContactListTileWidget(
            text: "+260950082577",
            icon: Icons.phone_in_talk_rounded,
            onTap: () {},
          ),
          SupportContactListTileWidget(
            text: "+260950081545",
            icon: Icons.phone,
            onTap: () {},
          ),
          SupportContactListTileWidget(
            text: "+mfinsolutions",
            icon: Icons.facebook_outlined,
            onTap: () {},
          ),
          SupportContactListTileWidget(
            text: "info@mightyfinance.co.zm",
            icon: Icons.mail,
            onTap: () {},
          ),
          SupportContactListTileWidget(
            text: "Plot no 13, Chikuni Road,off Makishi Rd, Northmead, Lusaka",
            icon: Icons.pin_drop_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
