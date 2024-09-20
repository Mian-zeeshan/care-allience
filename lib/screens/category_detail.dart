import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/category.dart';

class CategoryDetail extends StatelessWidget {
  final Category data;

  const CategoryDetail({super.key, required this.data});

  String _checkNullEmpty(String? value) {
    // return value != null && value.isNotEmpty ? value : 'Not Provided';
    return value != null && value.trim().isNotEmpty ? value : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailText('Name:', _checkNullEmpty(data.name), isBold: true),
            _buildDetailText('Category:',
                _checkNullEmpty("${data.edate ?? ""} ${data.etime ?? ""}")),
            _buildDetailText('Category:', _checkNullEmpty(data.category)),
            _buildDetailText('Address:', _checkNullEmpty(data.address)),
            _buildDetailText('City:', _checkNullEmpty(data.city)),
            _buildDetailText('State:', _checkNullEmpty(data.state)),
            _buildDetailText('Zip:', _checkNullEmpty(data.zip)),
            _buildDetailText('Detail:', _checkNullEmpty(data.report)),
            _buildDetailText('vlink:', _checkNullEmpty(data.vurl), isUrl: true),
            _buildDetailText('wlink:', _checkNullEmpty(data.wlink),
                isUrl: true),
            _buildDetailText('slink:', _checkNullEmpty(data.slink),
                isUrl: true),
            _buildDetailText('glink:', _checkNullEmpty(data.glink),
                isUrl: true),
            _buildDetailText('Logo:', _checkNullEmpty(data.logo)),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailText(String label, String value,
      {bool isUrl = false, bool isBold = false}) {
    return value.isNotEmpty
        ? InkWell(
            onTap: () {
              if (isUrl) {
                launchUrl(Uri.parse(value));
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    // TextSpan(
                    //   text: '$label ',
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                    TextSpan(
                      text: value,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              isBold ? FontWeight.bold : FontWeight.normal,
                          color: isUrl ? Colors.blue : Colors.black87,
                          decoration: isUrl
                              ? TextDecoration.underline
                              : TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
