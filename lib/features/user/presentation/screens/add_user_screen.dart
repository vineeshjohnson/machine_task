import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/common/colors.dart';
import 'package:user_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:user_app/features/user/presentation/widgets/headding_widget.dart';
import 'package:user_app/features/user/presentation/widgets/textfield_widget.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserCreatedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('User added successfully!'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[200], // Light background
            appBar: AppBar(
              backgroundColor: AllColors().textColor,
              title: const Text(
                'Add User',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Form(
                        key: _formKey, // Assigning the form key
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeaddingWidget(title: 'Create New User'),
                            const SizedBox(height: 20),

                            CustomTextFormField(
                              controller: nameController,
                              labelText: 'Full Name',
                              icon: Icons.person,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter a name";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),

                            CustomTextFormField(
                              controller: jobController,
                              labelText: 'Job Title',
                              icon: Icons.work,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter a job title";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),

                            // Custom Button with gradient
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<UserBloc>().add(AddUserEvent(
                                        name: nameController.text,
                                        job: jobController.text));
                                    print(
                                        "User Created: ${nameController.text}, ${jobController.text}");
                                  }
                                  nameController.clear();
                                  jobController.clear();
                                },
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AllColors().textColor,
                                ),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
