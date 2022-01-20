import 'package:flutter/material.dart';
import 'package:wallet_app/constants.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  static const List<String> features = <String>[
    'Send',
    'Pay',
    'Withdraw',
    'Bill',
    'Voucher',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleAndProfile(),
            DebitCard(),
            const SizedBox(
              height: 20,
            ),
            FeatureRow(),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'History',
                style: TextStyle(color: Colors.white),
              ),
            ),
            PaymentHistoryColumn()
          ],
        ),
      ),
    );
  }
}

class PaymentHistoryColumn extends StatelessWidget {
  const PaymentHistoryColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentHistoryCard(),
        PaymentHistoryCard(),
        PaymentHistoryCard(),
        PaymentHistoryCard(),
      ],
    );
  }
}

class FeatureRow extends StatelessWidget {
  const FeatureRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FeatureRowItem(),
        FeatureRowItem(),
        FeatureRowItem(),
        FeatureRowItem(),
        FeatureRowItem(),
      ],
    );
  }
}

class PaymentHistoryCard extends StatelessWidget {
  const PaymentHistoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      //height: 100,
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          Icons.access_alarm_outlined,
          size: 50,
        ),
        title: Text('Spotify Subscription'),
        subtitle: Text('21:12 am  21 June 2021'),
        trailing: Text('-\$11.99'),
      ),
    );
  }
}

class FeatureRowItem extends StatelessWidget {
  const FeatureRowItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Icon(
            Icons.arrow_back,
            size: 45,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        Text(
          'Label',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

class DebitCard extends StatelessWidget {
  const DebitCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        color: darkGray,
      ),
    );
  }
}

class TitleAndProfile extends StatelessWidget {
  const TitleAndProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Welcome back \n Sourav Pal',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: lightGray,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              'p',
              style: TextStyle(fontSize: 60),
            ),
          ),
        )
      ],
    );
  }
}
