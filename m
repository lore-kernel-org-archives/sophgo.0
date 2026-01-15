Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010012.outbound.protection.outlook.com [52.103.68.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919DC13AA2D
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 01:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768442090; cv=fail; b=n10nYYNO90gcsk31Fj1Kgd77v8RnVyZKFAJI8BR8t1P8JydJj2NL2I+Rl9gFTY71JtNZ0MnGi2bTjiEVjNfRuqfUm51X/iiZ2GhxqXGv6q5oBCP+ST00WIOlvndu7Noxxo3e4E6b6f3Dpehyn/L4gHBEbyyTXHQqkjoFHUpsLRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768442090; c=relaxed/simple;
	bh=LuddpMDEn8DKN1HO6xnHXjoF701anJ/Tujl8zWH29Nk=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=ZtZ6R85YUiOa2ldPkVGU/rxMfJhNd216t3YwALaBqbHJZu5OhGZxLwpUKnJTfnJR/MQ1ZJvsVAYKgdb2uiXL54qhv9Y15yNczJGUHcglQNFqYW8tRj5iUtRvid8PkE9opwBR1clktfJwTeukWrpuvxQdR/U05atcMMHvlEoFd54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mJ5QBZjD; arc=fail smtp.client-ip=52.103.68.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mJ5QBZjD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwpp84k4fVB0RvVLHZKHbVECVNSP+U6qTd0SCOx5MtmIsrCouGNwB9jl7nH9BcOZFVnRyf+CHs142/+9QoU8oi5e/9nsS80oKLVhROjpxhp4j+VGAQVpXhr3XugpPYjMN3wBeHXnsNvVuHswWV28Gi+ME+ed57qTHllAaaz7uD3dY4KLzbOWXkTLYHwpsRqvzK3H0D5tJXcm+Cw9xUHh90CkSS54XdFCwJt7LUeVn0t1EacVsTZiYLXR3k1tdzis4vkOG3+Qt7yuJ0PXPp+ZjHhGcn7b7pJ2h0LHa2ENFpWZQmnnXc07y9gPYcu7TW+vfpwAIFZSi3P2dpVg1e87Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtGNZLS0A85fwU5Dpd4tjKgLgL3nuZsNj+yVQJN157w=;
 b=O4HmdDCeB3G/Y/VuP1NKlL05kvMO6Aov+MRWhV4hrD4SRzrRCBTdyCcdasbzVXgVHSEjen+zPBRoc2UNVDkmqOUehDFpuqv8irH15EBteoIhf4H+Jrd52jZdPWbMhECU0BWKtl/351YTW2z5RMkRn9y8+UVPYJi7BOpFXLr+b+7K19YcyICLXdg8K7CYd/peVw6Fz4qSaRTQnpIIw/EjLPsSCS5EXbh9tneegTLXPRs/ecD3lT4udVE9rjmYMYlAN33v5jdUQX43LYF7dFfBPtiB+0TEawvqj+/VQE+RmXE/x0jiKJOLFzerxYKo5o/aPjLBybIJh3dmLVuKn3ieuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtGNZLS0A85fwU5Dpd4tjKgLgL3nuZsNj+yVQJN157w=;
 b=mJ5QBZjD51YsaBaJ4zp+lNUid1crWf8OmFHtJHyZ+j3ms3dnwgYQTLPjew+Klc7djI91hD88J3vwPQtsCkH5Kc9Tc0Se5UzBZnQwEqQAK6DsM1/xTShAPS61IJ0OE5Ac1q9tCsr/ayyL6p6DTtALJ7r5CawvWDADjjay5bj0DCVOL4G/h2YMv6+uBY8YAkfy/KQmcZYThCdFxtIJtcYJCVx8BX0QYpc/eF39Kv2D6zvL6tCXaiP+HuWFVVD7Fyb2MknPpWby6bgkaccmzohYB8ZB0sKFLqtgo+VVz/J0IMoJDPe/cpnFNr0+yji+66qHI1W47LbqGsLD5r6rZLe0sQ==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MA0PR01MB10283.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:12e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 01:54:42 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 01:54:42 +0000
Message-ID:
 <MA5PR01MB1250033E3B87E665A128C7DACFE8CA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 15 Jan 2026 09:54:39 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jan/15/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <e69c397e-c18d-4485-8efa-bd89db9105b3@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MA0PR01MB10283:EE_
X-MS-Office365-Filtering-Correlation-Id: afc1bb6d-5d2e-4d74-8415-08de53d90cc4
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwXZ5XHxNrJCjRnjimRBgM6STt09WYiiatfLoRvoHFedlm8682694YibmTBP04gvxrT18xPWbTdFsXPkRAraVNxh6bOFNiDOjMoqHRNfpdDjXht2H7la3tWnMbBWLA1B2wzz/iUR80Em3smyapufxclPyEg3KUWxNvW5JzTVvwCFFKQ+0WtdjHKlyu1AIHk6E95GK/epFafHEqtaMB9H5/xFlc0jIpheMOiH5x/2B8SOTORmHKgSH2St5qNVwYtKUqbqAfjQVG0byFZ7/uRTx/Nvgo1kwHLlSq/0ZDk0m6vLT3tizRW0QPMBHcNiqTiyrRQNDqicaVCM6UXsiDPG5xgu7MRGix0NzVUBWI3Z56aXy/3m9Ef5dwozHC/QOqUB9hKnoRJSpGu/70sJBA5qMV9gcHuRFSPme8wLQhVVSYXNnN/uqJs5NnPQLTar2kpePbumJMeZZNWFSz3eZkdgbH93gm/tx1wuvJ4Hyak8SHiC4j2h8vbNTnKnXnFUAVY+YymwjFGytPB5xLE+CVhGrNYd4Vrg3TlZ6hd32k3EdqsofOUuCsiWNGMsASjbSL8cuL/R7E7F9f94kaqF2zvcW9MQvCgCmig1DWduYdrKr4DKqYOwcaIPQbQGZ7avWGXtjCaAu6thlT/kLl0O0rDAiOBCmAPlyZP8m4T+tt/dvfkO7gMumCkQaDv6TkLaHjPHsXi4mQnZ69jnVEkqQBtwmr27/LXhCogq3pPjCRTMCaN4QlKcq6gj+EZWunbNNclhckQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|20031999003|55001999003|39105399006|8060799015|15080799012|23021999003|19110799012|22402599018|6090799003|461199028|5072599009|1602099012|13041999003|4302099013|10035399007|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TW5DdnMvbkFXNytlM0lINGNFbjIyN0hnUEtreU51K2o0Z3J4cVdxSjI5RFZE?=
 =?utf-8?B?N2FMT2pCajg1Y1paRGJjUDk2dno2bW40V3d0ZnVOVlZHOVozQzkrSDg5U1hB?=
 =?utf-8?B?dTZ2Y2pVRVFxV2QwWlhPVmlRSFpsSXZ2VFVIMDg0YWxQb1FYNFBDbVFyTHlM?=
 =?utf-8?B?bi9QeEZ0cHBJYnlOeDIvTjRQMjdTREhLQ3JiUDIzbGxROTY3c0NsQnRMbXZa?=
 =?utf-8?B?dkZVY1I3MzZhOXFRa210MTRUbmtzNVloYnJ2c1ErS3NIdjdZT282SDZXSFJJ?=
 =?utf-8?B?UTNVOXFjOThEKzRBb3FSL1FDY2ZWaXdneWZ6MUtoZlpqRWhHYlFEaXIycDNt?=
 =?utf-8?B?MWFCcEZHV0JJUFd1KzFBYVl2ckljY1JpYktlM3lvbzk5ek1QK0pBdCtnbjVL?=
 =?utf-8?B?aXRxdDhSY3U5Slo4Y3U1bFA3UnV1REtyanpqRlhUTDh5aWs3cWVDVWZrRk5l?=
 =?utf-8?B?MmszMHc3UElwR05IdlJ4VEFTSFMxOHRZRVVKUkVPcEh2NGRna3M2aEtpRlNt?=
 =?utf-8?B?RG1RbGNqajdINEQxVERiOVRxQm5DNm1rbktZUlhNcFRsaG1SU0ZHWU9jYVVG?=
 =?utf-8?B?OUNoRVJBcmNuK0xUTVZ2T3oyQkRYVGxTcUp2QmpKZUNtVW1JSlVGd2t5amQ1?=
 =?utf-8?B?VExQQVN5TTg0bGR6cjVTVEs2QUxpdzU3NDJSNjFkUWRXVUVqbHhVTkxVbzVa?=
 =?utf-8?B?Tk5KNmlBam5KWitPR21WVUtnNFlxNmUvQktkV1hkNmFOVENiMXZXVXhCdzBt?=
 =?utf-8?B?VW1mNldSMGxDbmdYWk05NjAwNWlyRDNISmdJK1JwMU5ibDZlaC9iK0NCK09m?=
 =?utf-8?B?eTdkOUtjYmFRLzJyRlk4THlqeFVMS0V1N0ZuRm5yQ2NEN3Q1bVE5WXMvejZV?=
 =?utf-8?B?cmY4dCtiQkxBdlh1bmRXcUFQbnhxMXlvQlJzZFlsKzdIbzJkd2hoSHhjYU5B?=
 =?utf-8?B?cmVoZHdQOG1wVVE4RU42WjJ6Rmg5VUNEbkRRQVBITTZYNnBwcGJxSGZRTk1C?=
 =?utf-8?B?RW9NeWppdU5RbDA4Zmh3cDE2OFVTVVJWekpWR1pYMUpHN2F4NUpyRFRtS1RE?=
 =?utf-8?B?UEtFWWp0UUZkV0RYUWRDUnQ2Tlpob0txT2lROXlCcFZwenc2UWtGZFNLbUtZ?=
 =?utf-8?B?NGJ0aFZDamNrYm5YZFpUbldNRmR1NnZTUVFCTjh5cmZ4RmpkZUo2enJ2bi8w?=
 =?utf-8?B?LzcwQzVpYWQxeXp4Y3FjMUJyOW1jcklYOXRwV3NOdVE1TmZHbG5JaDlMc29k?=
 =?utf-8?B?UllXWmFrM2pnallvZHBEMlBzVCtIUThlOUsrYzlkUTFhd2MxV1VxTlo3RDdV?=
 =?utf-8?B?L0tpL29rY0tFMmwxUVBjUEU4TWFaaldNelI1Y2laa01FYlAzVUtRVDhBcENi?=
 =?utf-8?B?ZzhJYjA4RHk3b3R1QXpOSkltMEphcmRPc2FwZmo4YVdlRUh6c254R21UVE5t?=
 =?utf-8?B?VXBGNE5yWDdMeDB6NFZUZzEvSzFkRDdGTFV1SEdaVlBFaXQ0SFNrSDNoSDlG?=
 =?utf-8?B?V3NnMCtNRFFaQStiOVdPTWxlS2x0Y3R5VHNHcXI4V1I0Q0VuUmx3VUNlZFVj?=
 =?utf-8?B?T3hKRG9qKzBiYWpLVXJQeThGZmFJME9oeWJ0Z1YrRGFDc2RQbjN1dzhyanlH?=
 =?utf-8?B?REZhRVgwL3I1TjdmNzYxb1ZUbEJvb0dmbUErUGtBQ25qdUJ1cE91Y1laTUtw?=
 =?utf-8?B?a08xc08vRW15cFhOVXFrdzlDaXlOY3Fvam42cHFkUFB0TGFVeVdjK0J0VDVH?=
 =?utf-8?B?NjdGc0xPV3diTnByMjUwY2h4QUNFczNKMnZzODZ5OFdyUkRyaTFRd3hESU5Z?=
 =?utf-8?B?SmJzZEY2aUxKSEFHMWxiaVdDVituK1ZvZjR2a0tIODJaRzZobXZSbG5nV05n?=
 =?utf-8?Q?uJEQgnpZ2cwPZ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk04YkxWaTI5czY4TUMwQ1d2aHNtMFZYRjhzTHYvYnpHU3Y3OXY4V2FVUlVv?=
 =?utf-8?B?OGt4aGcyWHhDYzZqMTJ4U0kyZjY5TlpqZys5RVYxMEZjc1hIbkxScUJSMG84?=
 =?utf-8?B?eUZBdTRKc1ZkZXNzd0FMMWU4RWcyM1Z5TnVQa2VLZ2RDdm9LcDhGMkZaeTM1?=
 =?utf-8?B?WXlrSThWMEcyaWlWMk5XNjFCYnQ4TTRDaGNQMjhHOUpHM0ZCcTkzVjRaUHJV?=
 =?utf-8?B?OVZUOGtsSitublpkRHR2VGZEQWhCaFV1Q0Q2SXhCQUpxRitvU3JaV1V4Z3kz?=
 =?utf-8?B?UjhTTmE0NXNsdzQ3Y2RUR29jV2J0TVJlWk45aXpNM1piRGlXRTE0V1ZXZlBk?=
 =?utf-8?B?QTNCaXUzWmhJWnVFU1VmblZlWjJ5U0g0anhUZUF1b2wzK3IzVTZ3c0ZNQ2tS?=
 =?utf-8?B?RjZBeFU2Q0kwUnhIYWU2bStHMUw1Ykh6bmdOVndsbnYwNFM5SHp3TUtadDZD?=
 =?utf-8?B?aUNRTmRnblZtQXlhdy9KcEJybzVJSmNYTldSWlhFNml6WERvai9WNVVLVFdo?=
 =?utf-8?B?THdWSFgyN2RRdVZENTJjWnFZcnc3NmR5NndWVTZnSUhTTHlFSFBCeGx2cHY3?=
 =?utf-8?B?dUdJbENocWZpSUV2eGFDVzMycjBUZDBTMXJoVHF4Rk9iUGpob0cyenFBejVE?=
 =?utf-8?B?TnRseXpGY2FWNEdDOENiSS95ZDBBeEVKU1ZWUnFDczNjZXJGOGJtNkVsYVl6?=
 =?utf-8?B?ZVhQclVKbXV6V0xYY0h3U3dDd2Vmek9RRHVmalB1Y3VrbEJ4QmVnTFNmczBj?=
 =?utf-8?B?c2hvNjh1Wm1TVUoxVXdHc0I0RXFyY0F5dGRUTDNHL0NMREJsS0c1OGJRYndW?=
 =?utf-8?B?S1FzYXMxbExOKzk1YnIya29sa3Q0bE91TURra2ZTNTI0cTllYjIxMFhnaUlo?=
 =?utf-8?B?cHZBbWdYL2NxQkE5am0vcUZlZGxJR0VYMXpLZ1U2RFVPK0xOc3VJLytjSzJD?=
 =?utf-8?B?Rk1rUHpOZ24rcnkxdkxHK1VlY2FXOHBhME9rVDZRejBvQWR4eXdmSlJ3aW52?=
 =?utf-8?B?REgyVm5ycllQSWs5SnlFZXFJRXNXYUQrUXFRUlNyWWNKYmpCZ1VTMUJYVXVS?=
 =?utf-8?B?UkdLbXNvQXVjS1l3bS9SL0VZc0duNk9VaTArSHhGL0ZGeVFKRnM3YWZWWXdO?=
 =?utf-8?B?YmpZNVB2aXNtYmVpSGNLQ0dwdXVHWmdNZWxVUnFqZG51SExJcFBxMVFHL2k1?=
 =?utf-8?B?SXp6dElxVjRXbGdyTzRZaXRXTUpab3ZxTHRPemwrL0ROR2tORFRqb2IwSkdY?=
 =?utf-8?B?RU55bU5zUzlkVjFySHRUYTVDMnYxOW1ZTnowYWo2OTdIejN0cW1KUVp4Z2xD?=
 =?utf-8?B?bWk4M1JnR3FKM0dibVppUWV6aU04dWdJWjdCUjd6dEZUV0FmRGxuREFySGlq?=
 =?utf-8?B?OUl2aUZoVis1YjNucFAzTU1LWDFFQ1NBOEdLMFpPQzNIYmtzTGdtTWcyanVa?=
 =?utf-8?B?Z0lUeUpzNnhidk1lUmo5aWRKZWpTSXZ4aXZFWTk0MnVMS0VTcUhDR3hYdDVO?=
 =?utf-8?B?WFVybjFJejArRDQwTjhTckdEMzB6aU95akMzalZyakRHWjZ0dTl0Y1VKUVQy?=
 =?utf-8?B?VzRuYXEvMWt6WWFxblNmSnlSaG1JMFNIcTJqU0tyaDFxQWtPVFEzeWs3Y3cr?=
 =?utf-8?B?djNXTUZCRnIxcVYrRWJVT3F1L0ZjdWNHbFR0aHd1WUt2MFIyeXI3N3ppNzNJ?=
 =?utf-8?B?andpc1U0ZGduaXF4b3psbWhCNHlPWEt4USs2VEtLM25mTG56VldCVnBMVEgv?=
 =?utf-8?B?M0c0a0w1Z0RZelF1bGswOFo2dG8zb0pjNlhHaERUUkxwR1FHVHFoZlBTd1hE?=
 =?utf-8?B?RXgvSys2b05UdGZSUnpycjRFRjk1UW9kRXhyL1htTTJyeGpGWU1hNW5yWitB?=
 =?utf-8?B?ZU5GSmRQRmV1dkZCS3YxbzNyTzNyYXVRbmdvU09YNzhyanM5Y0dtOURobmJo?=
 =?utf-8?Q?RVHp5a4XBk3suZkm/Y8Ecpgg4cBpWMbQ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc1bb6d-5d2e-4d74-8415-08de53d90cc4
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 01:54:42.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10283

Last updated: Jan/15/2026 @https://github.com/sophgo/linux/wiki

CV18XX
- N/A

SG2042
- RTC: v1 submitted and applied on sophgo/dt/riscv, will picked by 6.20. 
Thank you, Michael Orlitzky.
- PCI/sg2042: Avoid L0s and L1 on Sophgo 2042 PCIe Root Ports: v1 submitted.
- riscv: dts: Move plic/clint into sg2042-cpu and sort peripherals by 
addresses: v1 submitted.

SG2044
- PCI/sophgo: Avoid L0s and L1 on Sophgo 2044 PCIe Root Ports: Applied 
on pci/controller/dwc-sophgo. Will be picked by 6.20.


Happy new year 2026!

Chen


