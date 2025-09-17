Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011027.outbound.protection.outlook.com [52.103.68.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6083263889
	for <sophgo@lists.linux.dev>; Wed, 17 Sep 2025 05:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758088574; cv=fail; b=V76bJqzu2G+EIlwkF41BlrMAwH/3SuKwn1GhiOXFwMPyfb/6Ona3E3zAznE9XOpNNIvAVbEAv6KGAFvYKM/WN1+sJATPK4CMH+eYlsQeanHfqHA104ccpfOFSVCM2x5Q5gk9/RFJMlfE8SPLefJXjqH7VFEJscArdLY6INy3wZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758088574; c=relaxed/simple;
	bh=rMMt0teBCHNrhfodSxyi20bcWsDQsxoHlNBmkpiydEc=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=hP3+Sqtz7f36iY3pdb1SZ2ThzInEpA3CfLCUzUamv3UKQf5ye2lYnHoO0CqOqZvNeBwd5wa2/7B1HRbUEaoUoj1+yzXQTTBDe1nOFQLY9DRZnyQygze/zXHdayBQEBv8sZ3lm3FTRTrNRGWSo3bhakgoq3Q/gDk2WJ2NffSUUTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WcZptpYr; arc=fail smtp.client-ip=52.103.68.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WcZptpYr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRVuBscyFSd7Un9IfhuvUj8eKO07QXVqUJjR3UGWK1GhrlzJBncrO8CA8b9gPqgvSjz1CDP59O4o25KZkmvGok7jKJwTSyGpiVmu14FMpRU2n0IzG6HIlxgjFZw+tR19wr3EN3T6f0wQlj063nlqrJwsTWp4ETN55xxauEdqKUzoHwbYU8gmPiIBibb+i3gWF9xngaEaL9ufkH4tUU4ZS7hqz84TEQvmAOc5BlrJgFiS6Mu+N5KXnYxUDH+HLdKQgVWKAfr+KdDlwUxQ1MfMrkNGo8H2STf3w6HQbJGosRJWh7m8DiSJrbjObpMaR563gt4TCN47pSH7MbaapgFvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+siD+SplVaaBP0JPoa3yL4HpchuR9vc69drX7d3Ar0=;
 b=djM8gxdpb8utns3emd3L97uyA3Bf0ElzkvFlaXIeGwbjjTVeyLIHE2yGCyj/slDEv85odEvO3M9XGqC9vVGUuyIwWM/J53mg4HlRNpZm02iSxPfuy5a6s8BfglPKjqI0q2JSnidnVnE+jzE5hF/kwsTA9QPlILkSNYZVAkNjkKoRsM9QUoYYEuCYZ3yJF4yTfwTpXzQEmqKDR8Ld+qS4XUAs9ZjYiwjmTaFr4a4OONRKjzigprHERdw6i1ed7R81IOWQuNv5091nbFATWHGNRjvn/T8Azr+zK/xrcAQrpeyMyf9X9pjRaTxJexlt/8QGOD3qbcOoStwLHhGD0ebFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+siD+SplVaaBP0JPoa3yL4HpchuR9vc69drX7d3Ar0=;
 b=WcZptpYrR5E61lTSQP0LiK3PrZ25ANL9wuiGvJ0urPVDNoov3KKR7I083qYwbGsIZbW83NHXzuuiVaGX+91dUfhqpNN61KbKFVFSSQEbGsBaALxivOkIqLLVgY4HOYKUf9ESxGCUnXsYMmc4Xy7AXN8N5Sjm6/P3EYfhNdWtlngSl65cLqv7gqmy7wkH2n5ZI/gqcAol3oPSJ6AfQqpSysQrycKPfc5azSCot2WF0hgLv0yy4txvCJxGlHbIIGsNyP7OENkZiM79qZYqx8A/zxGIgB9olyuLkigHxEVJvaDDjQF93VKx1dge/lwcyU2wHYerjxUftZFfcU4bYNYGjg==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN2PR01MB9278.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:11a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 05:56:08 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 05:56:08 +0000
Message-ID:
 <MAUPR01MB11072DBC4DEF54F92CDDFFF42FE17A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 17 Sep 2025 13:56:04 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Sep/17/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <6628f801-95b7-4a2d-bee0-0ff37868ac95@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN2PR01MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 413f8f4b-2da9-4d75-1b9f-08ddf5aee51d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799012|5072599009|15080799012|6090799003|22402599018|8060799015|23021999003|1602099012|13041999003|39105399003|51005399003|40105399003|440099028|4302099013|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzlaK2ZxL2lkd0Y4S0MwUWo3VlhheUdVTkhKWFlmOXgrWFJ4Q3VZUkRBaTBL?=
 =?utf-8?B?YXRRby9ndVRPZFlxRzNnbDFjZHRUYnJZVi9CaS9naGxjTnIyK0Y1MktmK3dh?=
 =?utf-8?B?dnZYaEl4REI5YXk2dUozUFJqeTc3aXRpbDU2K1FQekJkdDF2Ujh3NEdPV1pi?=
 =?utf-8?B?U25PWjZwYlBVbGc1K0NUSjA5d2tKMlNwN0xMZWNRempVaWRacGQ2bU1YK1lo?=
 =?utf-8?B?QXFqbzF3eEhibXFjVGVxZFlLdWcxR0R0amhtdTdVNEZnVGFCTFZiUkhSTGxv?=
 =?utf-8?B?V1JvWmxXVEIrcDkyY0t3U2htVnlGYktkSWsvZm9hME5uTkxhVTNrRDBOWThy?=
 =?utf-8?B?eFZhYXRkZm0wRFVKTk1nY3hYNlRWSUJOQkt0dnp2NVhqTzBKLzFVZVJwZ3BG?=
 =?utf-8?B?UXlhbmZibGhEaWR2ZFc5aXBUN3BaOG94K2tKUkVhc0JRSWpkZkFvMmNJaEZE?=
 =?utf-8?B?bGYzQ1l0V1RTSFJCamFsWDF3L1FJSzA2cjhBdE1aOVN1OEZ5eE4yQXpCOWxx?=
 =?utf-8?B?WTczUE9QdzlPbWVEUDhUWm5FVURlUXE0eUJSZkNxTzFjNm1DWWplb2JzTjlX?=
 =?utf-8?B?WGNJR0FQWkZnYjJjcG1WYiswVEtUVlZCNWJYaUpTanRVMzdxY2RGMXhYaXFa?=
 =?utf-8?B?M0trWTljQ0l5alJOSHdlRjZnaXFPeklMK1cxTktCWitYUUNSdjlwNytBaDlw?=
 =?utf-8?B?M29rTUNPT2tLcElQaEF3VmlxOVlqQWtCT1BFbnBJdUNjR0hsbTlsYytkK0Ra?=
 =?utf-8?B?OUVIZlpHN1h0OVhzMHBPUWVSN2FKNm1JZnRhR1pvSFI5ekl6NlAwMnJwR1BB?=
 =?utf-8?B?VlRsc0pwRzYwMXYyWXZVQ0xBbHhwU1NvcHk0QVR2UE5nSDhmOFVyaC9iZGNT?=
 =?utf-8?B?UTJOd2FyNU12OXBtQUlPbGo0Wkd6R0RjbHZsTVc1a0s0Qzg4Y2NmQ0N1TlJr?=
 =?utf-8?B?UGgxTk94U2dEMHVaL3JOZXd0L1hzdVlaVmNadXVSUmptZ3dMU2wxdk40UTVT?=
 =?utf-8?B?dzFsbHVlVHpQMTdlK05lK0FkT1VsMWVKcm9MNFl0bFVhUndXWGJLRktaQ3Zh?=
 =?utf-8?B?Sy9wOGpyS1o0OXF0c1ZWQmczaW43cithdDlob0V6aXY3N2lRN05TWC9uYS9u?=
 =?utf-8?B?VS8wVllJcUkxT05Td3RCUEZDT1VJdXNiUVNRNjZpTEpJVUZWR2JKWVpRTlhq?=
 =?utf-8?B?R1Qwd2RjckVrTnhIMG82dG1vdkd6OHBBclpqK21ubWZDL1pxZk0zVmdnaXNs?=
 =?utf-8?B?QzhkdTc2Y3VwcWRXd3BoSUUyOVg0UHhEWXFPdVlmVFR0MTFNY0h5dVlnd3RL?=
 =?utf-8?B?NWgrVDVUa3k4b0FoNzZQS0JFL2oxV1dhck9FOHFtVjZXMmpOVUVKL21waVE3?=
 =?utf-8?B?N1BXZHVRWmwrYk9qOSsrOXd4dmt0c2Z2SXoxN3ZzVUFFM2phSXhWNmdDaHZn?=
 =?utf-8?B?ZHZacjRmUmJyS08wajVVZ1lKcUtkUFZvU0pqNkxrQlAxOVJlMU1rUFkrakVr?=
 =?utf-8?B?OTQrczdiVTZSQzdmMEZNNDgrOFk2OTZqRTRqTWNvbk80RmNPR0hBRlNYVWMy?=
 =?utf-8?B?V2JhZ2tSM1hBQkxHOFMxbWp4WE90cE5rM29MQU1LYkRBaHYwQXZ1dmR2VGls?=
 =?utf-8?B?ZkkzcUpsMkNnWFJQUVFZNG1KbjF5eUJ2N3pmSUxTUzV6SWQvTVhQeXlaWVhx?=
 =?utf-8?B?c2JCU0ZnZmhtcXY4RDllM3BqaHA4T1o3djR6Ujh5SUlGQzV0OElTclFjbmJY?=
 =?utf-8?B?K3hDSzBDdjh5R2RSb3ltMUdUb3p3SjhKNTc0TDY5eEhVdXdkb0xWZDR3MXE0?=
 =?utf-8?B?cDZ4Y0hJckVvUjBLbFgrQ2hEVHl0NDRzZ3gvNU9nUlJ2Zm82WjZjcnhmL05k?=
 =?utf-8?B?em01b3NoVElEblQyRnI4ODR4YzUrQ0V4OEMxMFJaUnh3K2c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVZXVkRHQ0ZlQm51NW83akFpUmMwYmgrQk8zd3l4eXhsbEFRcGFvbmhneEpM?=
 =?utf-8?B?RlZZWDVuMnZUenFHZlNZU3BwVFo3eWZnWGhKdnhlVEwzTDM3S2RZeGNjbjMw?=
 =?utf-8?B?WGl5WDAwM3dORmlyUW5tUEI2SUlDZm5BNHJPOW0vWXA4TnJsMnNWTlljakZn?=
 =?utf-8?B?NXl1bUJSOFpqbVF2REpYc0lUVWw0QlFrRC9qRFIzbVdpcmJsYS8yYm1lVklk?=
 =?utf-8?B?MU9yU1pxVlNVS1FMVVRWQlBLN0JyNUZBUkxFTDBOZ2lUZUdodXI0cW9lMGo0?=
 =?utf-8?B?UVhoSUc3VUdmZmJsYnZrUFp1dmpSbm53TmtPVkMzZDErb0FrQVRpY1JQRFEx?=
 =?utf-8?B?akZwL3YvaFRFMEJGMm5meHI0b1FBdXdNSlhhT1M3NVhTNnZCN29ZU2ordUxB?=
 =?utf-8?B?S29KMGxKM0djQ3RCWjVleHhJQ2xsYWpCUXMxNXVJTG5IakJOMGtKMWhmU3dZ?=
 =?utf-8?B?L2VqQ3c1Z0hYaW9HSWVXWVBoOXlxSTlkOC9qVkZ4Y3RXQUo3N01iMVN0SWk4?=
 =?utf-8?B?ZlBpSnVyaDlMRW1GeVNablM4cFdWMWE1TUlwWXQ0U0ZERFFidFBTVlFycEo4?=
 =?utf-8?B?YzgybE5XekxuVjlTOWRzYWZkR0RUWE04TnR0cU00aFRBczROLzVocUdFVGZR?=
 =?utf-8?B?N2phTWZkSk9KTHFiUXRZZmRqTEtMMmFnV1d3YmFaWWJoWEZvNEZkZFdXMFpV?=
 =?utf-8?B?dURDSjlBZUk2SGJYWDBKVHMyQSsyeXdlY0N5TDZKWC9pY20waGtwOXhSZzhu?=
 =?utf-8?B?SWNLSlA2aExERFFpZGJjQjBQNUduTGVpdmloOWhGa2lGQ0l3U0xVWmFLVHY5?=
 =?utf-8?B?NXRqelF5QjFyYXMzRjQ4NGZTbURqQ1dtYXJtSGZudlB3M1lWNDlTampUajd6?=
 =?utf-8?B?eFBBVDRLcmN6VHdGUGJuckJiU21JZDNwVzRlK2xpS21UUU1Qd0s4M1ZLVTZV?=
 =?utf-8?B?VU42U29kdEQ0dFRHOTVjNnl1M1lNNDdzcm10RHpUazFoOXJsUUozNC9taWxW?=
 =?utf-8?B?RU5tc3pKUGpzV3lWRVh6OHBFTUV2cWpFLzI2VUkvamtka1FaV2o2T0FXcG1u?=
 =?utf-8?B?SzRrQ3o2NzRjWFg2V0s3NkZqcitaM1NuTWp0aTJ5SzJZZTZuSklRMW9qanM4?=
 =?utf-8?B?VjdzQUNEOVpDVklCS0YyV2RaOWVyM1JSeHBaendGMWtOK29sYkxTY2N1dnJQ?=
 =?utf-8?B?cGZNamVHSE1oVkF5UnVheGtVTEdpV2ZYVEQzQnNwdGQ2Nm1ucWNCSGxYbENS?=
 =?utf-8?B?V1NvS0djcU9xNXJ0TDhIS2lmME03bkVrQ0ZNNS96a0hDenZUN3FlbkZad1Q5?=
 =?utf-8?B?K1BDenc3U3Q4T3hmSEFZUkdqOE5zZVlYb2xxaDNEK0JzaVc4ZGkxd2ZEMTBv?=
 =?utf-8?B?TEVnblhlZExtdjhOSFZ3V2JaWURVZVZkY0hJQ2NOV29ZNnp4WjZtb0dWcjZx?=
 =?utf-8?B?YkVvNHJCblh1QkRhYUtzUDV5Z0lHYlJibVVKYzNOR2U0ZmxaQjVBWUhaNk0w?=
 =?utf-8?B?RStyZ05CSFEydE9PZW11QUlJQ3E1ejM2MnhoRVVaQzFVNTNlaVRyS1lMNHBx?=
 =?utf-8?B?V2pxMUMzeU8zTVVrdnVGNFM3VENQOHlmWk90WUo1ZksycnJIbW5DM01SdDFX?=
 =?utf-8?B?aENwbnlmUzdUeFFMSVpna0p4ZzByMno4cVJhQmoyRWpLTzhOMzhKTlBoam56?=
 =?utf-8?B?Vkc4dHdOOFRUbnQ2UFhWMG5aUFkzTDZ1ajExck92a25yQ2VscTFOalEreFd1?=
 =?utf-8?Q?Wkqh9AkK/QCup8WdrdLQnT1SxFZ/bHUMnDA0wRO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413f8f4b-2da9-4d75-1b9f-08ddf5aee51d
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:56:07.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9278

Last updated: Sep/17/2025 @https://github.com/sophgo/linux/wiki

# CV18xx:

- USB phy is pulled, expected to be picked by 6.18

# SG2042

- SPI-nor: DTS part is updated to v2, may need more updated after some 
discussion.

- PCIe driver: updated to v3.

- Add numa id description (v1)

# SG2044

- N/A


Thanks,

Chen

