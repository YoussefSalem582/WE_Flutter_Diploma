// import 'package:flutter/material.dart';
//
//
// class userDetails extends StatelessWidget {
//   late Map data;
//   userDetails(this.data);
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('email is: ${data['email']}',
//               style: TextStyle(fontSize: 40),),
//             Text('password is: ${data['password']}',
//               style: TextStyle(fontSize: 40),),
//             Text('id is: ${data['id']}',
//               style: TextStyle(fontSize: 40),)
//           ]
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class userDetails extends StatefulWidget {
  final Map data;
  userDetails(this.data);

  @override
  _userDetailsState createState() => _userDetailsState();
}

class _userDetailsState extends State<userDetails> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();emailController = TextEditingController(text: widget.data['email']);
    passwordController = TextEditingController(text: widget.data['password']);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email
            Row(
              children: [
                Text('Email: ${widget.data['email']}', style: TextStyle(fontSize: 20)),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter new email',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Password
            Row(
              children: [
                Text('Password: ${widget.data['password']}', style: TextStyle(fontSize: 20)),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter new password',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),// ID (non-editable)
            Row(
              children: [
                Text('ID: ', style: TextStyle(fontSize: 20)),
                Text(widget.data['id'].toString(), style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 32), // Add spacing before the button

            // Save Changes Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle saving changes here (e.g., call a function to update the database)
                  // For now, just printing the updated values
                  print("New Email: ${emailController.text}");
                  print("New Password: ${passwordController.text}");
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}