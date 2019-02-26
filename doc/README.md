# Protocol Documentation
<a name="top"/>

## Table of Contents

- [proto/com/iab/adcom/adcom.proto](#proto/com/iab/adcom/adcom.proto)
  
  
  
  

- [proto/com/iab/adcom/context/context.proto](#proto/com/iab/adcom/context/context.proto)
    - [Content](#com.iab.adcom.Content)
    - [Data](#com.iab.adcom.Data)
    - [Device](#com.iab.adcom.Device)
    - [DistributionChannel](#com.iab.adcom.DistributionChannel)
    - [DistributionChannel.App](#com.iab.adcom.DistributionChannel.App)
    - [DistributionChannel.DOOH](#com.iab.adcom.DistributionChannel.DOOH)
    - [DistributionChannel.Site](#com.iab.adcom.DistributionChannel.Site)
    - [Geo](#com.iab.adcom.Geo)
    - [Producer](#com.iab.adcom.Producer)
    - [Publisher](#com.iab.adcom.Publisher)
    - [Regs](#com.iab.adcom.Regs)
    - [Segment](#com.iab.adcom.Segment)
    - [User](#com.iab.adcom.User)
  
  
  
  

- [proto/com/iab/adcom/media/media.proto](#proto/com/iab/adcom/media/media.proto)
    - [Ad](#com.iab.adcom.Ad)
    - [Ad.Audio](#com.iab.adcom.Ad.Audio)
    - [Ad.Audit](#com.iab.adcom.Ad.Audit)
    - [Ad.Display](#com.iab.adcom.Ad.Display)
    - [Ad.Video](#com.iab.adcom.Ad.Video)
  
  
  
  

- [proto/com/iab/adcom/placement/placement.proto](#proto/com/iab/adcom/placement/placement.proto)
    - [Placement](#com.iab.adcom.placement.Placement)
    - [Placement.AudioPlacement](#com.iab.adcom.placement.Placement.AudioPlacement)
    - [Placement.Companion](#com.iab.adcom.placement.Placement.Companion)
    - [Placement.DisplayPlacement](#com.iab.adcom.placement.Placement.DisplayPlacement)
    - [Placement.VideoPlacement](#com.iab.adcom.placement.Placement.VideoPlacement)
  
  
  
  

- [Scalar Value Types](#scalar-value-types)



<a name="proto/com/iab/adcom/adcom.proto"/>
<p align="right"><a href="#top">Top</a></p>

## proto/com/iab/adcom/adcom.proto
Make it easy to include adcom by providing a single point of entry.

 

 

 

 



<a name="proto/com/iab/adcom/context/context.proto"/>
<p align="right"><a href="#top">Top</a></p>

## proto/com/iab/adcom/context/context.proto
This group of objects represent concepts that are interacting, presenting, enclosing, or are 
otherwise relating to the world in which impressions live. These include the user, their device,
their location, the channel (e.g., site, app, digital out-of-home) with which they are 
interacting, the channel&#39;s publisher, its content, and any regulations that are in effect
(e.g., COPPA, GDPR).


<a name="com.iab.adcom.Content"/>

### Content
This object describes the content in which an impression can appear, which may be syndicated or 
non-syndicated content. This object may be useful when syndicated content contains impressions 
and does not necessarily match the publisher&#39;s general content. An exchange may or may not have 
knowledge of the page where the content is running as a result of the syndication method (e.g., 
a video impression embedded in an iframe on an unknown web property or device).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ID uniquely identifiying the content. |
| episode | [int32](#int32) |  | Episode number. |
| title | [string](#string) |  | Content title. Video examples: &#34;Search Committee&#34; (television), &#34;Star Wars, A New Hope&#34; (movie), or &#34;Endgame&#34; (made for web). Non-video Example: &#34;Why an Antarctic Glacier Is Melting So Quickly&#34; (Time magazine article). |
| series | [string](#string) |  | Content series. Video examples: &#34;The Office&#34; (television), &#34;Star Wars&#34; (movie), or &#34;Arby &#39;N&#39; The Chief&#34; (made for web). non-video example: &#34;Ecocentric&#34; (Time Magazine blog). |
| season | [string](#string) |  | Content season (e.g., &#34;Season 3&#34;). |
| artist | [string](#string) |  | Artist credited with the content. |
| genre | [string](#string) |  | Genre that best describes the content (e.g., rock, pop, etc). |
| album | [string](#string) |  | Album to which the content belongs; typically for audio. |
| isrc | [string](#string) |  | International Standard Recording Code conforming to ISO-3901. |
| url | [string](#string) |  | URL of the content, for buy-sdie contextualization or review. |
| cat | [string](#string) | repeated | Array of content categories describing the content using IDs from the taxonomy indicated in &#34;cattax&#34;. |
| cattax | [enums.CategoryTaxonomy](#com.iab.adcom.enums.CategoryTaxonomy) |  | The taxonomy in use for the &#34;cat&#34; attribute. Refer to List: Category Taxonomies. |
| prodq | [enums.ProductionQuality](#com.iab.adcom.enums.ProductionQuality) |  | Produciton quality. Refer to List: Production Qualities. |
| context | [enums.ContentContext](#com.iab.adcom.enums.ContentContext) |  | Type of content (game, video, text, etc.). Refer to List: Content Contexts |
| rating | [string](#string) |  | Content rating (e.g., MPAA). |
| mrating | [enums.MediaRating](#com.iab.adcom.enums.MediaRating) |  | Media rating per IQG guidelines. Refer to List: Media Ratings. |
| keywords | [string](#string) | repeated | Array of kewyords describing the content. TOOD(@joelpm): deviates but makes more sense to me. |
| live | [bool](#bool) |  | Indication of live content, where false = not live, true = live (e.g. stream, live blog). |
| srcrel | [int32](#int32) |  | Source relationship, where 0 = indirect, 1 = direct. TODO(@joelpm): rename drctsrcrel and make boolean? |
| len | [int32](#int32) |  | Length of content in seconds; typically for video or audio. |
| lang | [string](#string) |  | Content language using ISO-639-1-alpha-2. |
| embed | [bool](#bool) |  | Indicator of whether or not the content is embedded off-site from the site or app described in those objects (e.g., an embedded video player), where false = no, true = yes. |
| producer | [Producer](#com.iab.adcom.Producer) |  | Details about the content producer. Refer to Object: Producer. |
| data | [Data](#com.iab.adcom.Data) | repeated | Additional user data. Each &#34;Data&#34; object represents a different data source. Refer to Object: Data. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Data"/>

### Data
The data and segment objects together allow additional data about the related object (e.g., 
user, content) to be specified. This data may be from multiple sources whether from the exchange
itself or third parties as specified by the &#34;id&#34; attribute. When in use, vendor-specific IDs 
should be communicated a priori among the parties.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Vendor-specific ID for the data provider. |
| name | [string](#string) |  | Vendor-specific displayable name for the data provider. |
| segment | [Segment](#com.iab.adcom.Segment) | repeated | Array of &#34;Segment&#34; objects that contain the actual data values. Refer to Object: Segment. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Device"/>

### Device
This object provides information pertaining to the device through which the user is interacting.
Device information includes its hardware, platform, location, and carrier data. The device can 
refer to a mobile handset, a desktop computer, set top box, or other digital device.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [enums.DeviceType](#com.iab.adcom.enums.DeviceType) |  | The general type of device. Refer to List: Device Types. |
| ua | [string](#string) |  | Browser user agent string. |
| ifa | [string](#string) |  | ID sanctioned for advertiser use in the clear (i.e., not hashed). |
| dnt | [bool](#bool) |  | Standard &#34;Do Not Track&#34; flag as set in the header by the browser, where false = tracking is unrestricted, true = do not track. |
| lmt | [bool](#bool) |  | &#34;Limit Ad Tracking&#34; signal commercially endorsed (e.g., iOS, Android), where false = tracking is unrestricted, true = tracking must be limited per commercial guidelines. |
| make | [string](#string) |  | Device make (e.g., &#34;Apple&#34;). |
| model | [string](#string) |  | Device model (e.g., &#34;iPhone&#34;). |
| os | [enums.OperatingSystem](#com.iab.adcom.enums.OperatingSystem) |  | Device operating system. Refer to List: Operating Systems. |
| hwv | [string](#string) |  | Hardware version of the device (e.g. &#34;5S&#34; for iPhone 5S). |
| h | [int32](#int32) |  | Physical height of the screen in pixels. |
| w | [int32](#int32) |  | Physical width of the screen in pixels. |
| ppi | [int32](#int32) |  | Screen size as pixels per linear inch. |
| pxratio | [float](#float) |  | The ratio of pixels to device independent pixels. |
| js | [bool](#bool) |  | Support for Javascript, where false = no, true = yes. |
| lang | [string](#string) |  | Browser language using ISO-639-1-alpha-2. |
| ip | [string](#string) |  | IPv4 address closest to device. |
| ipv6 | [string](#string) |  | IPv6 address closest to device. |
| xff | [string](#string) |  | The value of the x-frowarded-for header. |
| iptr | [bool](#bool) |  | Indicator of truncation of any of the IP attributes (i.e., &#34;ip&#34;, &#34;ipv6&#34;, &#34;xff&#34;, where true = yes, false = no (e.g., from 1.2.3.4 to 1.2.3.0). Refer to tools.ietf.org/html/rfc6235#section-4.1.1 for more information on IP truncation. |
| carrier | [string](#string) |  | Carrier or ISP (e.g., &#34;VERIZON&#34;) using exchange curated string names which should be published to bidders a priori. |
| mccmnc | [string](#string) |  | Mobile carrier as the concatenated MCC-MNC code (e.g., &#34;310-005&#34; identifies Verizon Wireless CDMA in the USA). Refer to en.wikipedia.org/wiki/Mobile_country_code for further information and references. Note that the dash between the MCC and MNC parts is required to remove parsing ambiguity. |
| mccmncsim | [string](#string) |  | MCC and MNC of the SIM card using the same format as &#34;mccmnc&#34;. When both values are available, a difference between them reveals that a user is roaming. |
| contype | [enums.ConnectionType](#com.iab.adcom.enums.ConnectionType) |  | Network connection type. Refer to List: Connection Types. |
| feofetch | [bool](#bool) |  | Indicates if the geolocation API will be available to Javascript code running in display ad, where false = no, true = yes. |
| geo | [Geo](#com.iab.adcom.Geo) |  | Location of the device (i.e., typically the user&#39;s current location). Refer to Object: Geo. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.DistributionChannel"/>

### DistributionChannel
A distribution channel is an abstraction of the various types of entities or channels through 
which ads are distributed. Examples include websites, mobile apps, and digital out-of-home (DOOH)
systems. This generalized class contains those attributes and relationships that are common to 
all distribution channels and as such, all of its attributes and relationships are inherited by 
each of its derived classes.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Vendor specific unique identifier of the distribution channel. Recommended. |
| name | [string](#string) |  | Displayable name of the distribution channel. |
| pub | [Publisher](#com.iab.adcom.Publisher) |  | Details about the publisher of the distribution channel. Refer to Object: Publisher. |
| content | [Content](#com.iab.adcom.Content) |  | Details about the content within the distribution channel. Refer to Object: Content. |
| site | [DistributionChannel.Site](#com.iab.adcom.DistributionChannel.Site) |  |  |
| app | [DistributionChannel.App](#com.iab.adcom.DistributionChannel.App) |  |  |
| dooh | [DistributionChannel.DOOH](#com.iab.adcom.DistributionChannel.DOOH) |  |  |






<a name="com.iab.adcom.DistributionChannel.App"/>

### DistributionChannel.App
This object is used to define an ad supported non-browser application, in contrast to a typical
website.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| domain | [string](#string) |  | Domain of the app (e.g., &#34;mygame.foo.com&#34;) |
| cat | [string](#string) | repeated | Array of content categories describing the app using IDs from the taxomony indicated in &#34;cattax&#34;. |
| sectcat | [string](#string) | repeated | Array of content categories describing the current section of the app using IDs from the taxonomy indicated in &#34;cattax&#34;. |
| pagecat | [string](#string) | repeated | Array of content categories describing the current page or view of the app using IDs from the taxonomy indicated in &#34;cattax&#34;. |
| cattax | [enums.CategoryTaxonomy](#com.iab.adcom.enums.CategoryTaxonomy) |  | The taxonomy in use for the &#34;cat&#34;, &#34;sectcat&#34;, &#34;pagecat&#34; attributes. Refer to List: Category Taxonomies. |
| privpolicy | [bool](#bool) |  | Indicates if the site has a privacy policy, where false = no, true = yes. |
| keywords | [string](#string) | repeated | Array of keywords about the app. TODO(@joelpm): deviates from standard, check if this makes sense |
| bundle | [string](#string) |  | Bundle or package name of the app (e.g., &#34;com.foo.mygame&#34;) and should NOT be app store IDs (e.g., Apple iTunes, Google Play) |
| storeid | [string](#string) |  | The ID of the app in an app store (e.g., Apple iTunes, Google Play). |
| storeurl | [string](#string) |  | App store URL for an installed app; for IQG 2.1 compliance. |
| ver | [string](#string) |  | Application version. |
| paid | [bool](#bool) |  | Indicator of whether or not this is a paid app, where false = free, true = paid. Default = false |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.DistributionChannel.DOOH"/>

### DistributionChannel.DOOH
This object is used to define an ad supported digital out-of-home (DOOH) experience such as a 
public kiosk or digital billboard.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| venue | [enums.DOOHVenueType](#com.iab.adcom.enums.DOOHVenueType) |  | The type of out-of-home venue. Refer to List: DOOH Venue Types. |
| fixed | [int32](#int32) |  | Indicates whether the DOOH placement is in a fixed location (e.g., kiosk, billboard, elevator) or is movable (e.g., taxi), where 1 = fixed, 2 = movable. |
| etime | [int32](#int32) |  | The exposure time in seconds per view that the creative will be displayed before refreshing to the next creative. |
| dpi | [int32](#int32) |  | Minimum DPI for text-based creative elements to display clearly. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.DistributionChannel.Site"/>

### DistributionChannel.Site
This object is used to define an ad supported website, in contrast to a non-browser 
application, for example.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| domain | [string](#string) |  | Domain of the site (e.g., &#34;mysite.foo.com&#34;). |
| cat | [string](#string) | repeated | Array of content categories describing the site using IDs from the taxomony indicated in &#34;cattax&#34;. |
| sectcat | [string](#string) | repeated | Array of content categories describing the current section of the site using IDs from the taxonomy indicated in &#34;cattax&#34;. |
| pagecat | [string](#string) | repeated | Array of content categories describing the current page or view of the site using IDs from the taxonomy indicated in &#34;cattax&#34;. |
| cattax | [enums.CategoryTaxonomy](#com.iab.adcom.enums.CategoryTaxonomy) |  | The taxonomy in use for the &#34;cat&#34;, &#34;sectcat&#34;, &#34;pagecat&#34; attributes. Refer to List: Category Taxonomies. |
| privpolicy | [bool](#bool) |  | Indicates if the site has a privacy policy, where false = no, true = yes. |
| keywords | [string](#string) | repeated | Array of keywords about the site. TODO(@joelpm): deviates from standard, check if this makes sense |
| page | [string](#string) |  | URL of the page within the site. |
| ref | [string](#string) |  | Referrer URL that casued navigation to the current page. |
| search | [string](#string) |  | Search string that caused navigation to the current page. |
| mobile | [bool](#bool) |  | Indicates if the site has been programmed to optimize layout when viewed on mobile devices, where false = no, true = yes. |
| amp | [bool](#bool) |  | Indicates if the page is built with AMP HTML, where false = no, true = yes. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Geo"/>

### Geo
This object encapsulates various methods for specifying a geographic location. When subordinate 
to a &#34;Device&#34; object, it indicates the location of the device which can also be interpreted as 
the user&#39;s current location. When subordinate to a &#34;User&#34; object, it indicates the location of 
the user&#39;s home base (i.e., not necessarily their current location).

The &#34;lat&#34; and &#34;lon&#34; attributes should only be passed if they conform to the accuracy depicted in
the &#34;type&#34; attribute. For example, the centroid of a large region (e.g., postal code) should not
be passed.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [enums.LocationType](#com.iab.adcom.enums.LocationType) |  | Source of location data; recommended when passing lat/lon. Refer to List: Location Types. |
| lat | [float](#float) |  | Latitude from -90.0 to &#43;90.0, where negative is south. |
| lon | [float](#float) |  | Longitude from -180.0 to &#43;180.0, where negative is west. |
| accur | [int32](#int32) |  | Estimated location accuracy in meters; recommended when lat/lon are specified and derived from a device&#39;s location services (i.e., type = 1). Note that this is the accuracy as reported from the device. Consult OS specific documentation (e.g., Android, iOS) for exact interpretation. |
| lastfix | [int32](#int32) |  | Number of seconds since this geolocation fix was established. Note that devices may cache location data across multiple fetches. Ideally, this value should be from the time the actual fix was taken. |
| ipserv | [enums.LocationService](#com.iab.adcom.enums.LocationService) |  | Service or provider used to determine geolocation from IP address if applicable (i.e., &#34;type&#34; = 2). Refer to List: IP Location Services. |
| country | [string](#string) |  | Country code using ISO-3166-1-alpha-2. Note that alpha-3 codes may be encountered and vendors are encouraged to be tolerant of them. |
| region | [string](#string) |  | Region code using ISO-3166-2; 2-letter state code if USA |
| metro | [string](#string) |  | Regional marketing areas such as Nielsen&#39;s DMA codes or other similar taxonomy to be agreed among vendors prior to use. Note that DMA is a trademarked asset of The Nielsen Company. Vendors are encouraged to ensure their use of DMAs is properly licensed. |
| city | [string](#string) |  | City using United Nations Code for Trade &amp; Transport Locations &#34;UN/LOCODE&#34; with the space between country and city suppressed (e.g., Boston MA, USA = &#34;USBOS&#34;). Refer to UN/LOCODE Code List. |
| zip | [string](#string) |  | ZIP or postal code. |
| utcoffset | [int32](#int32) |  | Local time as the number of &#43;/- of minutes from UTC. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Producer"/>

### Producer
This object defines the producer of the content in which ad will be displayed. This is 
particularly useful when the content is syndicated and may be distributed through different 
publishers and thus when the producer and publisher are not necessarily the same entity.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Vendor-specific unique producer identifer. Useful if content is syndicated and may be posted a site using using embed tags. Recommended. |
| name | [string](#string) |  | Displayable name of the producer. |
| domain | [string](#string) |  | Highest level domain of the producer (e.g., &#34;producer.com&#34;). |
| cat | [string](#string) | repeated | Array of content categories that describe the producer using IDs from the taxonomy indicated in &#34;cattax&#34;. |
| cattax | [enums.CategoryTaxonomy](#com.iab.adcom.enums.CategoryTaxonomy) |  | The taxonomy in use for the &#34;cat&#34; attributed. Refer to List: Category Taxonomies. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Publisher"/>

### Publisher
This object describes the publisher of the media in which ads will be displayed.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Vendor-specific unique publisher identifier, as used in ads.txt files. Recommended. |
| name | [string](#string) |  | Displayable name of the publisher. |
| domain | [string](#string) |  | Highest level domain of the publisher (e.g., &#34;publisher.com&#34;). |
| cat | [string](#string) | repeated | Array of content categories that describe the publisher using IDs from the taxonomy indicated in &#34;cattax&#34;. |
| cattax | [enums.CategoryTaxonomy](#com.iab.adcom.enums.CategoryTaxonomy) |  | The taxonomy in use for the &#34;cat&#34; attribute. Refer to List: Category Taxonomies. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Regs"/>

### Regs
This object contains any known legal, governmental, or industry regulations that are in effect.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| coppa | [bool](#bool) |  | Flag indicating if COPPA regulations apply, where false = no, true = yes. The Children&#39;s Online Privacy Protection Act (COPPA) was established by the U.S. Federal Trade Commission. |
| gdpr | [bool](#bool) |  | Flag indicating if GDPR regulations apply, where false = no, true = yes. The General Data Protection Regulation (GDPR) is a regulation of the European Union. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Segment"/>

### Segment
Segment objects are essentially key-value pairs that convey specific units of data. The parent 
&#34;Data&#34; object is a collection of such values from a given data provider. When in use, vendor-
specific IDs should be communicated a priori among the parties.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ID of the data segment specific to the data provider. |
| name | [string](#string) |  | Displayable name of the data segment specific to the data provider. |
| value | [string](#string) |  | String representation of the data segment value. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.User"/>

### User
This object contains information known or derived about the human user of the device (i.e., the 
audience for advertising). The user ID is a vendor-specific artifact and may be subject to 
rotation or other privacy policies. However, this user ID must be stable long enough to serve 
reasonably as the basis for frequency capping and retargeting.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Vendor-specific ID for th euser. At least one of &#34;id&#34; or &#34;buyeruid&#34; is strongly recommended. |
| buyeruid | [string](#string) |  | Buyer-specific ID for the user as mapped by an exchange for the buyer. At least one of &#34;id&#34; or &#34;buyeruid&#34; is strongly recommended. |
| yob | [int32](#int32) |  | Year of birth as a 4-digit integer. |
| gender | [string](#string) |  | Gender, where &#34;M&#34; = male, &#34;F&#34; = female, &#34;O&#34; = known to be other (i.e., omitted is unknown). |
| keywords | [string](#string) | repeated | Array of keywords, interests, or intent. TODO(@joelpm): deviates. |
| consent | [string](#string) |  | GDPR content string if applicable, complying with the IAB standard Consent String Format in the Transparency and Consent Framework technical specifications. |
| geo | [Geo](#com.iab.adcom.Geo) |  | Location of the user&#39;s home base (i.e., not necessarily their current location). Refer to Object: Geo. |
| data | [Data](#com.iab.adcom.Data) | repeated | Additional user data. Each &#34;Data&#34; object represents a different data source. Refer to Object: Data. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |





 

 

 

 



<a name="proto/com/iab/adcom/media/media.proto"/>
<p align="right"><a href="#top">Top</a></p>

## proto/com/iab/adcom/media/media.proto
The Media group of objects defines an actual ad including reference to its creative and metadata 
to enable proper rendering, restrictions compliance, event tracking, and quality auditing. The 
following figure presents the objects and interrelationships in this group. The objects are 
defined in the subsections thereafter.


<a name="com.iab.adcom.Ad"/>

### Ad
This object is the root of a structure that defines in instance of advertising media. It includes
metadata about the ad overall and sub-objects that provide additional detail specific to the type 
of media comprising the creative.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Required. ID of the creative; unique at least throughout the scope of a vendor (e.g., an exchange or buying platform). Note that multiple instances of the same ad when used in transactions must have the same ID. |
| adomain | [string](#string) | repeated | Recommended. Advertiser domain; top two levels only (e.g., &#34;ford.com&#34;). This can be an array for the case of rotating creatives. |
| bundle | [string](#string) | repeated | When the product of the ad is an app, the unique ID of that app as a bundle or package name (e.g., &#34;com.foo.mygame&#34;). This should NOT be an app store ID (e.g., no iTunes store IDs). This can be an array of for the case of rotating creatives. |
| iurl | [string](#string) |  | URL without cache-busting to an image that is representative of the ad content for cursory level ad quality checking. |
| cat | [string](#string) | repeated | Array of content categories describing the ad using IDs from the taxonomy indicated in &#34;cattax&#34;. |
| cattax | [enums.CategoryTaxonomy](#com.iab.adcom.enums.CategoryTaxonomy) |  | The taxonomy in use for the &#34;cat&#34; attribute. Refer to List: Category Taxonomies. The default value is 2. |
| lang | [string](#string) |  | Language of the creative using ISO-639-1-alpha-2. In practice, vendors using this object may elect an alternate standard (e.g., BCP-47) in which case this must be communicated a priori. The non-standard code &#34;xx&#34; may also be used if the creative has no linguistic content (e.g., a banner with just a company logo). |
| attr | [enums.Creative.Attribute](#com.iab.adcom.enums.Creative.Attribute) |  | Set of attributes describing the creative. Refer to List: Creative Attributes. |
| secure | [int32](#int32) |  | Flag to indicate if the creative is secure (i.e., uses HTTPS for all assets and markup), where 0 = no, 1 = yes. There is no default and thus if omitted, the secure state is unknown. However, as a practical matter, the safe assumption is to treat unknown as non-secure. |
| mrating | [enums.MediaRating](#com.iab.adcom.enums.MediaRating) |  | Media rating per IQG guidelines. Refer to List: Media Ratings. |
| init | [string](#string) |  | Date/time of the original instantiation of this ad (i.e., this object or any of its children) in the format of ISO-8601; W3C profile. Refer to www.w3.org/TR/NOTE-datetime. |
| lastmod | [string](#string) |  | Date/time of most recent modification to this ad (i.e., this object or any of its children) in the format of ISO-8601; W3C profile. Refer to www.w3.org/TR/NOTE-datetime. |
| display | [Ad.Display](#com.iab.adcom.Ad.Display) |  | If set, indicates this is a display ad and provides additional detail as such. Refer to Object: Display. |
| video | [Ad.Video](#com.iab.adcom.Ad.Video) |  | If set, indicates this is a video ad and provides additional detail as such. Refer to Object: Video. |
| audio | [Ad.Audio](#com.iab.adcom.Ad.Audio) |  | If set, indicates this is an audio ad and provides additional detail as such. Refer to Object: Audio. |
| audit | [Ad.Audit](#com.iab.adcom.Ad.Audit) |  | An object depicting the audit status of the ad; typically part of a quality/safety review process. Refer to Object: Audit. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Ad.Audio"/>

### Ad.Audio
This object provides additional detail about an ad specifically for audio ads.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mimes | [string](#string) | repeated | Mime type(s) of the ad creative(s) (e.g., &#34;audio/mp4&#34;). |
| apis | [enums.APIFramework](#com.iab.adcom.enums.APIFramework) | repeated | API required by the ad if applicable. Refer to List: API Frameworks |
| types | [enums.Creative.AudioType](#com.iab.adcom.enums.Creative.AudioType) | repeated | Subtype of video creative. Refer to List: Creative Subtypes - Audio. |
| adm | [string](#string) |  | Video markup (e.g., DAAST document) for the asset. |
| curl | [string](#string) |  | A URL that returns the video markup (e.g., DAAST document) for the asset. If this ad is matched to a placement specification, the &#34;Placement.ref&#34; attribute indicates if this markup retrieval option is supported. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Ad.Audit"/>

### Ad.Audit
This objects represents the outcome of some form of review of the ad. This is typical, for 
example, when scanning for malware or otherwise performing ad quality reviews.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [enums.AuditStatusCode](#com.iab.adcom.enums.AuditStatusCode) |  | The audit status of the ad. Refer to List: Audit Status Codes. |
| feedback | [string](#string) | repeated | One or more human-readable explanations as to reasons for rejection or any changes to fields for ad quality reasons (e.g., &#34;adomain&#34;, &#34;cat&#34;, &#34;attr&#34;, etc.) |
| init | [string](#string) |  | Date/time of the original instantiation of this object in the format of ISO-8601; W3C profile. Refer to www.w3.org/TR/NOTE-datetime. |
| lastmod | [string](#string) |  | Date/time of the original instantiation of this object in the format of ISO-8601; W3C profile. Refer to www.w3.org/TR/NOTE-datetime. |
| corr | [google.protobuf.Any](#google.protobuf.Any) |  | Correction object wherein the auditor can specify changes to attributes of the &#34;Ad&#34; object or its children they believe to be proper. For example, if the original &#34;Ad&#34; indicated a category of &#34;IAB3&#34;, but the auditor deems the correct category to be &#34;IAB13&#34;, then &#34;corr&#34; could include a sparse &#34;Ad&#34; object including just the &#34;cat&#34; array indicating &#34;IAB13&#34;. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Ad.Display"/>

### Ad.Display
This object provides additional detail about an ad specifically for display ads. There are 
multiple attributes for specifying creative details: &#34;banner&#34; for simple banner images &#34;native&#34;
for native ads, &#34;ad&#34; for including general markup, and &#34;curl&#34; for referencing general markup via
URL. In any given &#34;Display&#34; object, only one of these attributes should be used to avoid
confusion. To the extent feasible, structured objects should be favored over general markup for
quality and safety issues.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mime | [string](#string) |  | Mime type of the ad (e.g., &#34;image/jpeg&#34;). |
| api | [enums.APIFramework](#com.iab.adcom.enums.APIFramework) |  | API required by the ad if applicable. Refer to List: API Frameworks. |
| type | [enums.Creative.DisplayType](#com.iab.adcom.enums.Creative.DisplayType) | repeated | Subtype of display creative. Refer to List: Creative Subtypes - Display. |
| w | [int32](#int32) |  | Absolute width of the creative in device independent pixels (DIPS), typically for non-native ads. Note that mixing absolute and relative sizes is not recommended. |
| h | [int32](#int32) |  | Absolute height of the creative in device independent pixels (DIPS), typically for non-native ads. Note that mixing absolute and relative sizes is not recommended. |
| wratio | [int32](#int32) |  | Relative width of the creative when expressing size as a ratio, typically for non-native ads. Note that mixing absolute and relative sizes is not recommended. |
| hratio | [int32](#int32) |  | Relative height of the creative when expressing size as a ratio, typically for non-native ads. Note that mixing absolute and relative sizes is not recommended. |
| adm | [string](#string) |  | General display markup (e.g., HTML, AMPHTML) if not using a structured alternative (e.g., &#34;banner&#34;, &#34;native&#34;). |
| curl | [string](#string) |  | Optional means of retrieving display markup by reference; a URL that can return HTML, AMPHTML, or a collection native &#34;Asset&#34; object and their subordinates). If this ad is matched to a Placement specification, the &#34;Placement.ref&#34; attribute indicates if this markup retrieval option is supported. |
| banner | [Ad.Display.Banner](#com.iab.adcom.Ad.Display.Banner) |  | Structured banner image object, recommended for simple banner creatives. Refer to Object: Banner. |
| native | [Ad.Display.Native](#com.iab.adcom.Ad.Display.Native) |  | Structured native object, recommended for native ads. Refer to Object: Native. |
| event | [Ad.Display.Event](#com.iab.adcom.Ad.Display.Event) | repeated | Array of events that the advertiser or buying platform wants to track. Refer to Object: Event. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.Ad.Video"/>

### Ad.Video
This object provides additional detail about an ad specifically for video ads.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mimes | [string](#string) | repeated | Mime type(s) of the ad creative(s) (e.g., &#34;video/mp4&#34;). |
| apis | [enums.APIFramework](#com.iab.adcom.enums.APIFramework) | repeated | API required by the ad if applicable. Refer to List: API Frameworks |
| types | [enums.Creative.VideoType](#com.iab.adcom.enums.Creative.VideoType) | repeated | Subtype of video creative. Refer to List: Creative Subtypes - Video. |
| adm | [string](#string) |  | Video markup (e.g., VAST document) for the asset. |
| curl | [string](#string) |  | A URL that returns the video markup (e.g., VAST document) for the asset. If this ad is matched to a placement specification, the &#34;Placement.ref&#34; attribute indicates if this markup retrieval option is supported. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |





 

 

 

 



<a name="proto/com/iab/adcom/placement/placement.proto"/>
<p align="right"><a href="#top">Top</a></p>

## proto/com/iab/adcom/placement/placement.proto
The Placement group includes objects that define the set of allowed ads for a given impression.
This can include mechanical information (e.g., sizes, supported mime types and other rendering 
options), placement details and positioning, various restrictions lists (e.g., advertiser 
domains, content categories), and more.


<a name="com.iab.adcom.placement.Placement"/>

### Placement
This object represents the properties of a placement and the characteristics of ads permitted to
be rendering within them. Placements of all types begin with this object as their root. It 
contains one or more subtype objects (i.e., &#34;display&#34;, &#34;video&#34;, &#34;audio&#34;) that define the kinds of
media permitted as well as media specific placement behaviors.

The other attributes in this object apply to all aspects and substructures of the placement
(i.e., the same block lists, language, secure status, etc. apply to all media types and native 
assets as applicable).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tagid | [string](#string) |  | Identifier for specific ad placement or ad tag; unique within a distribution channel. |
| ssai | [int32](#int32) |  | Indicates if server-side ad insertion (e.g., stitching an ad into an audio or video stream) is in use and the impact of this on asset and tracker retrieval, where 1 = all client-side, 2 = assets stitched server-side but tracking pixels fired client-side, 3 = all server-side. Default = 0. |
| sdk | [string](#string) |  | Name of ad mediation partner, SDK technology, or player responsible for rendering ad (typically video, audio, or mobile); used by some ad servers to customize ad code by partner. |
| sdkver | [string](#string) |  | Version of the SDK specified in the &#34;sdk&#34; attribute. |
| reward | [int32](#int32) |  | Indicates if this is a rewarded placement, where 0 = no, 1 = yes. Default = 0. |
| bcats | [string](#string) | repeated | Block list of content categories using IDs from the taxonomy indicated in &#34;cattax&#34;. |
| cattax | [com.iab.adcom.enums.CategoryTaxonomy](#com.iab.adcom.enums.CategoryTaxonomy) |  | The taxonomy in use for the &#34;bcat&#34; attribute. Default = 2. Refer to List: Category Taxonomies. |
| badvs | [string](#string) | repeated | Block list of advertisers by their domains (e.g., &#34;ford.com&#34;). |
| bapps | [string](#string) | repeated | Block list of apps for which ads are disallowed. These should be bundle or package names (e.g., &#34;com.foo.mygame&#34;) and should NOT be app store IDs (e.g., not iTunes store IDs). |
| battrs | [com.iab.adcom.enums.Creative.Attribute](#com.iab.adcom.enums.Creative.Attribute) | repeated | Block list of creative attributes. Refer to List: Creative Attributes. |
| wlangs | [string](#string) | repeated | Whitelist of permitted languages of the creative using ISO-639-1-alpha-2. In practice, vendors using this object may elect an alternate standard (e.g., BCP-47) in which case this must be communicated a priori. Omission of this attribute indicates there are no restrictions. |
| secure | [int32](#int32) |  | Flag to indicate if the creative is secure (i.e., uses HTTPS for all assets and markup), where 0 = no, 1 = yes. There is no default and thus if omitted, the secure state is unknown. However, as a practical matter, the safe assumption is to treat unknown as non-secure. |
| admx | [int32](#int32) |  | Indicates if including markup is supported (i.e., the various &#34;ad&#34; attributes throughout the &#34;Placement&#34; structure), where 0 = no, 1 = yes. |
| curlx | [int32](#int32) |  | Indicates if retrieving markup via URL reference is supported (i.e., the various &#34;curl&#34; attributes throughout the &#34;placement&#34; structure), where 0 = no, 1 = yes. |
| display | [Placement.DisplayPlacement](#com.iab.adcom.placement.Placement.DisplayPlacement) |  | Placement Subtype Object that indicates that this may be a display placement and provides additional detail related thereto. Refer to Object: DisplayPlacement. * At least one placement subtype is required. |
| video | [Placement.VideoPlacement](#com.iab.adcom.placement.Placement.VideoPlacement) |  | Placement Subtype Object that indicates that this may be a video placement and provides additional detail related thereto. Refer to Object: VideoPlacement. * At least one placement subtype is required. |
| audio | [Placement.AudioPlacement](#com.iab.adcom.placement.Placement.AudioPlacement) |  | Placement Subtype Object that indicates that this may be an audio placement and provides additional detail related thereto. Refer to Object: AudioPlacement. * At least one placement subtype is required. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.placement.Placement.AudioPlacement"/>

### Placement.AudioPlacement
This object signals that the placement may be an audio placement and provides additional 
detail about permitted audio ads (e.g., DAAST).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| delay | [int32](#int32) |  | Indicates the start delay in seconds for pre-roll, mid-roll, or post-roll placements. For additional generic values, refer to List: Start Delay Modes. |
| skip | [bool](#bool) |  | Indicates if the placement imposes ad skippability, where false = no, true = yes. |
| skipmin | [int32](#int32) |  | The placement allows creatives of total duration greater than this number of seconds to be skipped; only applicable if the ad is skippable. Default 0. |
| skipafter | [int32](#int32) |  | Number of seconds a creative must play before the placement enables skipping; only applicable if the ad is skippable. |
| playmethod | [com.iab.adcom.enums.PlaybackMethod](#com.iab.adcom.enums.PlaybackMethod) |  | Playback method in use for this placement. Refer to List: Playback Methods. |
| playend | [com.iab.adcom.enums.PlaybackCessationMode](#com.iab.adcom.enums.PlaybackCessationMode) |  | The event that causes playback to end for this placement. Refer to List: Playback Cessation Modes. |
| feed | [com.iab.adcom.enums.FeedType](#com.iab.adcom.enums.FeedType) |  | Type of audio feed for this placement. Refer to List: Feed Types. |
| nvol | [com.iab.adcom.enums.VolumeNormalizationMode](#com.iab.adcom.enums.VolumeNormalizationMode) |  | Volume normalization mode of this placement. Refer to List: Volume Normalization Modes. |
| mime | [string](#string) | repeated | Array of supported mime types (e.g., &#34;audio/mp4&#34;). If omitted, all types are assumed. Required. |
| api | [com.iab.adcom.enums.APIFramework](#com.iab.adcom.enums.APIFramework) | repeated | List of supported APIs for this placement. If an API is not explicitly listed, it is assumed to be unsupported. Refer to List: API Frameworks. |
| ctype | [com.iab.adcom.enums.Creative.AudioType](#com.iab.adcom.enums.Creative.AudioType) | repeated | Creative subtypes permitted for this placement. Refer to List: Creative Subtypes - Audio. |
| mindur | [int32](#int32) |  | Minimum creative duration in seconds. |
| maxdur | [int32](#int32) |  | Maximum creative duration in seconds. |
| maxext | [int32](#int32) |  | Maximum extended creative duration if extension is allowed. If 0, extension is not allowed. If -1, extension is allowed and there is no time limit imposed. If greater than 0, then the value represents the number of seconds of extended play supported beyond the &#34;maxdur&#34; value. |
| minbitr | [int32](#int32) |  | Minimum bit rate of the creative in Kbps. |
| maxbitr | [int32](#int32) |  | Maximum bit rate of the creative in Kbps. |
| delivery | [com.iab.adcom.enums.DeliveryMethod](#com.iab.adcom.enums.DeliveryMethod) | repeated | Array of supported creative delivery methods. If omitted, all can be assumed. Refer to List: Delivery Methods. |
| maxseq | [int32](#int32) |  | The maximum number of ads that can be played in a pod. |
| comp | [Placement.Companion](#com.iab.adcom.placement.Placement.Companion) | repeated | Array of objects indicating that companion ads are available and providing the specifications thereof. Refer to Object: Companion. |
| comptype | [com.iab.adcom.enums.CompanionType](#com.iab.adcom.enums.CompanionType) | repeated | Supported companion ad types; recommended if companion ads are specified in &#34;comp&#34;. Refer to List: Companion Types |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.placement.Placement.Companion"/>

### Placement.Companion
This object is used in video and audio placements to specify an associated or so-called
companion display ad. Video and audio placements can specify an array of companion ads.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Identifier of the companion ad; unique within this placement. |
| vcm | [int32](#int32) |  | Indicates the companion ad rendering mode relative to the associated video or audio ad, where 0 = concurrent, 1 = end card. For a given placement, typically only one companion at most should be designated as an end card. |
| display | [Placement.DisplayPlacement](#com.iab.adcom.placement.Placement.DisplayPlacement) |  | Display specification object representing the companion ad. Refer to Object: DisplayPlacement. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.placement.Placement.DisplayPlacement"/>

### Placement.DisplayPlacement
This object signals that the placement may be a display placement. It provides additional
detail about permitted display ads including simple banners, AMPHTML (i.e., Accelerated Mobile
Pages), and native.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pos | [com.iab.adcom.enums.PlacementPosition](#com.iab.adcom.enums.PlacementPosition) |  | Placement position on screen. Refer to List: Placement Positions. |
| instl | [int32](#int32) |  | Inidicates if this is an interstitial placement, where 0 = no, 1 = yes. Default 0. |
| topframe | [int32](#int32) |  | Indicates if the placement will be loaded into an iframe or not, where 0 = unfriendly iframe or unknown, 1 = top frame, friendly iframe, or SafeFrame. A value of &#34;1&#34; can be understood to mean that expandable ads are technically capable of being delivered. |
| ifrbusts | [string](#string) | repeated | Array of iframe busters supported by this placement. The meaning of strings in this attribute must be coordinated a priori among vendors. |
| clktype | [com.iab.adcom.enums.ClickType](#com.iab.adcom.enums.ClickType) |  | Indicates the click type of this placement. Refer to List: Click Types. |
| ampren | [int32](#int32) |  | AMPHTML rendering treatment for AMP ads in this placement, where 1 = early loading, 2 = standard loading. |
| ptype | [com.iab.adcom.enums.DisplayPlacementType](#com.iab.adcom.enums.DisplayPlacementType) |  | Recommended. The display placement type. Refer to List: Display Placement Types. |
| context | [com.iab.adcom.enums.DisplayContextType](#com.iab.adcom.enums.DisplayContextType) |  | Recommended. The context of the placement. Refer to List: Display Context Types |
| mimes | [string](#string) | repeated | Array of supported mime types (e.g., &#34;image/jpeg&#34;, &#34;image/gif&#34;). If omitted, all types are assumed. |
| apis | [com.iab.adcom.enums.APIFramework](#com.iab.adcom.enums.APIFramework) | repeated | List of supported APIs. If an API is not explicitly listed, it is assumed to be unsupported. Refer to List: API Frameworks. |
| ctypes | [com.iab.adcom.enums.Creative.DisplayType](#com.iab.adcom.enums.Creative.DisplayType) | repeated | Creative subtypes permitted. Refer to List: Creative Subtypes - Display. |
| w | [int32](#int32) |  | Width of the placement in units specified by &#34;unit&#34;. Note that this size applies to the placement itself; permitted creative sizes are specified elsewhere (e.g. &#34;DisplayFormat&#34;, &#34;ImageAssetFormat&#34;, etc.). |
| h | [int32](#int32) |  | Width of the placement in units specified by &#34;unit&#34;. Note that this size applies to the placement itself; permitted creative sizes are specified elsewhere (e.g., &#34;DisplayFormat&#34;, &#34;ImageAssetFormat&#34;, etc.). |
| unit | [com.iab.adcom.enums.SizeUnit](#com.iab.adcom.enums.SizeUnit) |  | Unit of size used for placement size (i.e., &#34;w&#34; and &#34;h&#34; attributes). Default = 1. Refer to List: Size Units. |
| displayfmts | [Placement.DisplayPlacement.DisplayFormat](#com.iab.adcom.placement.Placement.DisplayPlacement.DisplayFormat) | repeated | Array of objects that govern the attributes (e.g., sizes) of a banner display placement. Note that including both &#34;displayfmt&#34; and &#34;nativefmt&#34; is not recommended. Refer to Object: DisplayFormat. |
| nativefmt | [Placement.DisplayPlacement.NativeFormat](#com.iab.adcom.placement.Placement.DisplayPlacement.NativeFormat) |  | This object specified the required and permitted assets and attributes of a native display placement. Note that including both &#34;displayfmt&#34; and &#34;nativefmt&#34; is not recommended. Refer to Object: NativeFormat. |
| event | [Placement.DisplayPlacement.EventSpec](#com.iab.adcom.placement.Placement.DisplayPlacement.EventSpec) | repeated | Array of supported ad tracking events. Refer to Object: EventSpec |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |






<a name="com.iab.adcom.placement.Placement.VideoPlacement"/>

### Placement.VideoPlacement
This object signals that the placement may be a video placement and provides additional detail
about permitted video ads (e.g., VAST).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ptype | [com.iab.adcom.enums.VideoPlacementSubtype](#com.iab.adcom.enums.VideoPlacementSubtype) |  | Placement subtype. Refer to List: Placement Subtypes - Video. |
| pos | [com.iab.adcom.enums.PlacementPosition](#com.iab.adcom.enums.PlacementPosition) |  | Placement position on screen. Refer to List: Placement Positions. |
| delay | [int32](#int32) |  | Indicates the start delay in seconds for pre-roll, mid-roll, or post-roll placements. For additional generic values, refer to List: Start Delay Modes. |
| skip | [bool](#bool) |  | Indicates if the placement imposes ad skippability, where false = no, true = yes. |
| skipmin | [int32](#int32) |  | The placement allows creatives of total duration greater than this number of seconds to be skipped; only applicable if the ad is skippable. Default = 0. |
| skipafter | [int32](#int32) |  | Number of seconds a creative must play before the placement enables skipping; only applicable if the ad is skippable. Default = 0. |
| playmethod | [com.iab.adcom.enums.PlaybackMethod](#com.iab.adcom.enums.PlaybackMethod) |  | Playback method in use for this placement. Refer to List: Playback Methods. |
| playend | [com.iab.adcom.enums.PlaybackCessationMode](#com.iab.adcom.enums.PlaybackCessationMode) |  | The event that causes playback to end for this placement. Refer to List: Playback Cessation Modes. |
| clktype | [com.iab.adcom.enums.ClickType](#com.iab.adcom.enums.ClickType) |  | Indicates the click type of the placement. Refer to List: Click Types. |
| mime | [string](#string) | repeated | Array of supported mime types (e.g., &#34;video/mp4&#34;). If omitted, all types are assumed. Required. |
| api | [com.iab.adcom.enums.APIFramework](#com.iab.adcom.enums.APIFramework) | repeated | List of supported APIs for this placement. If an API is not explicitly listed, it is assumed to be unsupported. Refer to List: API Frameworks. |
| ctype | [com.iab.adcom.enums.Creative.VideoType](#com.iab.adcom.enums.Creative.VideoType) | repeated | Creative subtypes permitted for this placement. Refer to List: Creative Subtypes - Video. |
| w | [int32](#int32) |  | Width of the creative in units specified by &#34;unit&#34;. |
| h | [int32](#int32) |  | Height of the creative in units spcified by &#34;unit&#34;. |
| unit | [com.iab.adcom.enums.SizeUnit](#com.iab.adcom.enums.SizeUnit) |  | Units of size used for &#34;w&#34; and &#34;h&#34; attributes. Refer to List: Size Units. Default = 1. |
| mindur | [int32](#int32) |  | Minimum creative duration in seconds. |
| maxdur | [int32](#int32) |  | Maximum creative duration in seconds. |
| maxext | [int32](#int32) |  | Maximum extended creative duration if extension is allowed. If 0, extension is not allowed. If -1, extension is allowed and there is no time limit imposed. If greater than 0, then the value represents the number of seconds of extended play supported beyond the &#34;maxdur&#34; value. Default = 0. |
| minbitr | [int32](#int32) |  | Minimum bit rate of the creative in Kbps. |
| maxbitr | [int32](#int32) |  | Maximum bit rate of the creative in Kbps. |
| delivery | [com.iab.adcom.enums.DeliveryMethod](#com.iab.adcom.enums.DeliveryMethod) | repeated | Array of supported creative delivery methods. If omitted, all can be assumed. Refer to List: Delivery Methods. |
| maxseq | [int32](#int32) |  | The maximum number of ads that can be played in an ad pod. |
| linear | [com.iab.adcom.enums.LinearityMode](#com.iab.adcom.enums.LinearityMode) |  | Indicates if the creative must be linear, nonlinear, etc. If none specified, no restrictions are assumed. Refer to List: Linearity Modes. |
| boxing | [bool](#bool) |  | Indicates if letterboxing of 4:3 creatives into a 16:9 window is allowed, where false = no, true = yes. Default = true. TODO(@joelpm): bool defaults to false - consider changing spec? |
| comp | [Placement.Companion](#com.iab.adcom.placement.Placement.Companion) | repeated | Array of objects indicating that companion ads are available and providing the specifications thereof. Refer to Object: Companion. |
| comptype | [com.iab.adcom.enums.CompanionType](#com.iab.adcom.enums.CompanionType) | repeated | Supported companion ad types; recommended if companion ads are specified in &#34;comp&#34;. Refer to List: Companion Types. |
| ext | [google.protobuf.Any](#google.protobuf.Any) |  | Optional vendor-specific extensions. |





 

 

 

 



## Scalar Value Types

| .proto Type | Notes | C++ Type | Java Type | Python Type |
| ----------- | ----- | -------- | --------- | ----------- |
| <a name="double" /> double |  | double | double | float |
| <a name="float" /> float |  | float | float | float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long |
| <a name="bool" /> bool |  | bool | boolean | boolean |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str |

