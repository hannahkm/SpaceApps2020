# SpaceApps2020 - brought to you by the COVID Earth Initiative
### What is the COVID Earth Initiative?
We are a group of five students looking to make a change and help our planet. We were inspired by the NASA Space Apps Challenge to collaborate and find solutions regarding the negative effects of human traffic on our national parks. We are taking the *initiative* and help keep our parks healthy and to ensure that they can be enjoyed by many more generations of Americans and visitors to come.

Due to COVID-19, many national parks were closed to help prevent the spread of the virus. This resulted in a significant decrease in the number of visitors at major national parks across the country compared to previous years. Using data provided by NASA's Giovanni and the US Geology Study, we aimed to identify any differences, whether positive or negative, in the environment between 2019 and 2020.

### What data did we use?
* [NASA's Giovanni Web Interface](https://giovanni.gsfc.nasa.gov/giovanni/): data about the optical depth of aerosols, amount of nitrogen dioxide and methane in the atmosphere, transpiration of plants, and vegetation. Area was specificed to be over the Great Smoky National Park in Tennessee and North Carolina.
* [The US Geological Study](https://waterdata.usgs.gov/nwis): water temperature, pH level, and amounts of dissolved oxygen in the French Broad River and Catawba River.

### How did we pick our locations?
![Map of locations](/images/map.png)

The Great Smoky Mountains National Park is one of the most popular parks in the nation, hosting up to 1 million visitors per month during the summer each year. In addition, it is located directly in between two cities: Nashville, Tennessee and Charlotte, North Carolina, which would result in more traffic, more visitors, and more human interaction. Due to its popularity and proximity to these cities, any changes in the environment due to stay at home orders would be more drastic as visitors disappear.

The French Broad River and Catawba River are both located between the park and Charlotte. Catawba, in particular, runs directly besides Charlotte. Due to their location, these rivers may be affected directly by the traffic of people through Charlotte and on highways and may reflect some of the same changes that the Smoky Mountains experienced.

### What did we find?
Using data obtained from NASA’s Giovanni web interface and the US Geological Study, our team used R to study the differences in the environment between 2019 and 2020. Giovanni was used to access variables such as the optical depth of aerosols, the number of nitrogen dioxide molecules, the amount of transpiration and vegetation, and the molar fraction of methane over a rectangular section of land around the Great Smoky Mountains National Park. The US Geological study was used to obtain the quality of water of the French Broad River and the Catawba River, which were chosen based on their proximity to the park and Charlotte, a large city. 

Each dataset was split into its 2019 and 2020 equivalents, focusing on the available data during the months of January through May of both years. First, we attempted to plot daily values for each year in a scatterplot to display the change of each variable over time. In order to provide a more clear comparison between the two years, however, we averaged the data for each month and plotted the results as a bar graph. This allowed us to see how human traffic, or the lack thereof, generally impacted the environment. 

In the end, we were able to identify changes in aerosols, nitrogen dioxide, and transpiration within the Great Smoky National Park as well as a change in water temperature and dissolved oxygen within the Catawba River. This successfully confirmed our prediction that less human traffic would lead to an improvement in air and water quality. 

### In conclusion
Over the course of one month, the environment within the park flourished in the absence of visitors. Humans have a larger impact on nature than some may even realize. Thankfully, we don't need to stay at home in order to protect the planet. Here's how you, and others, can help.
* Avoid or limit personal vehicle usage - steer away (get it??) from gasoline-powered vehicles, aim to carpool, or even ditch your car in favor of a bike!
* Reduce your waste - what you bring to the park, you must bring away from the park. Don't leave your trash around, and try switching to reusable products.
* Follow guidelines - respect the park's rules. Don't try to interact with the wildlife.
* Research the impacts of humans on the environment - this project just scratches the surface of studying our relationship with nature. How do cars, litter, or roadsalt affect plants growing besides the highway? How does our light and noise pollution interfere with animals near us? The more you know, the more you will be able to protect our planet.
