import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';
import '../../authentication/blocs/auth_bloc.dart';

class UserProfileImageWidget extends StatelessWidget {
  const UserProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AuthSuccess) {
            final user = state.user;
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                          user.profilePhotoUrl!,
                          scale: 2
                      ),
                      radius: 50,
                    ),
                    Text(
                      "${user.fname ?? "N/A"}  ${user.lname ?? "N/A"}",
                      style: GoogleFonts.montserrat(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(user.email),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: primary,
              ),
            );
          }
        },
      ),
    );
  }
}