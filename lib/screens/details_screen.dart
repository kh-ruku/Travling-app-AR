import 'package:flutter/material.dart';
import 'package:travling_app/app_data.dart';

class DetailsScreen extends StatelessWidget {
  static const screenRoute = 'details screen';

  final Function manageFav;
  final Function isFav;

  DetailsScreen(this.manageFav,this.isFav);

  Widget SectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.all(15),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget ListViewContainer(child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        height: 240,
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = tripsData.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedTrip.title}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            SectionTitle(context, 'الانشطة'),
            ListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Text(
                      selectedTrip.activities[index],
                    ),
                  ),
                ),
              ),
            ),
            SectionTitle(context, 'البرنامج اليومي'),
            ListViewContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Text(
                        "اليوم ${index + 1}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    title: Text(
                      selectedTrip.program[index],
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Divider()
                ],
              ),
              itemCount: selectedTrip.program.length,
            )),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFav(tripId) ? Icons.star : Icons.star_border
        ),
        onPressed:() => manageFav(tripId),
      ),
    );
  }
}
