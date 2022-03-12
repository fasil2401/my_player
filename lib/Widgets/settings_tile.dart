import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
   SettingsTile({Key? key,required this.text,required this.leadicon, this.tailicon}) : super(key: key);

  final String text; 
  final IconData leadicon;
  Widget? tailicon;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children:  [
                Icon(
                  leadicon,
                  size: 26,
                ),
               const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style:const TextStyle(fontFamily: "Poppins", fontSize: 21),
                )
              ],
            ),
            tailicon == null ?
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ) : tailicon!,
          ],
        ),
      ),
    );
  }
}
