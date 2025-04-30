Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010013.outbound.protection.outlook.com [52.103.67.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71906182D7
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 02:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745980016; cv=fail; b=Svc5LQ1cf4adO9TfLaa5/hiKHnJEdp2anPqWtIIUhW3tqeipll/yPCxaInWiTdpVyrr4tle1m2WBiY2ppTDD0u2ZNtilY7Xx96R49eCD9Jz02u723h/rXg3NAFkVyk42Z8nzIRZnxBgXjulRF4bOxDaaeY917RanS7aKSoe7Uuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745980016; c=relaxed/simple;
	bh=n3lPykHVdsU14w1feFTGeuvdEOrKsuGy8SmEnq/MLiQ=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=MY6qNekvL4y/aq8qo9BXEZUYRQEz6AmlLOcc+St01Uat8nGAQE9CEZNh/BL1rX7C0g96t28+WDTf9b38ztOoNVMnTD+SRBYtyy1Y9Jm2al8/sYftHGX431E+hSSzAJLzy2xBB2ZbsQ3FYloeCNJK3euN1dvYYl3kDw4QIWYrqsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=g1t+q98r; arc=fail smtp.client-ip=52.103.67.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="g1t+q98r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brqn9wzV92As5buZVXgRBUkE4fvtn6NFCUf9dLortAIAmLkdlryTCLGZTppqEobjrQFMyQF0oEwf9hhQWt/VxLcA3SkicyNHDg9IeGu0wxGo6HTXo9CWb2KLyL0bLAAWBsPAYXvmm8+uG/eHeCOQoffqQTJEI/Hl9NK1zEA5rHxFOPY7lGLDPy3ZMP93tItJiuJXvpDQrM1kAC+G9ce7uf2U5VIqlKfiiq+5XyjLee1HlG2M/GTIi865HR7TMPB/Q0PhWI5n+9S6N/5ESuibQVK8nh+46X9V8AeXoO8mg1TB2kHelpxYMpZsI+Ror4YPFqJeBHm+lyHivgN6NEc+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3lPykHVdsU14w1feFTGeuvdEOrKsuGy8SmEnq/MLiQ=;
 b=yuQbO1dlEVVaDo+NFxIPoTb9U4vE7i8P2zzFTcwn9dShbDsIVnwsHFsuNiWcAhYe24rcvgNBJ6Lc42aKROMu6Ll5vMfB5QAd2kJ1EkgSiudOTu9Jn48oExfBnixegj+/HikIlAwqQB5RAQwU38owMJ6a+hCOrt3OsHD9QdXHNIFrei7uMNuv6LqMxYu0DhOFLZ+bsJ9tcIjjOFJakSzsSF81OelAYA2F70aIssO21UHJnKoWcJGvaIjOU9NW8xYES37RpsC+QW82aUB3p9zulnRPf7NDH8LAdlCrcXHE1Yp4TYqFloRRAW5tUnBiI0ZLBVyLRbIURMPPRQmlwpxVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3lPykHVdsU14w1feFTGeuvdEOrKsuGy8SmEnq/MLiQ=;
 b=g1t+q98rujKVSegAlXOVmJSF5iVyubbF9THZkNtBihcC/SxqJ2uotIzOXRRotWZgGa/RK7RGwIFN14lnL+sL8cgv/rRo4V/XFCmWCjSWF2ismYWmQW14azZWyTmtrOrBV8hHRjQu8WbHwF3MQpMEeSWPMl0Cc3fvnnYWyXj3U8plHqrgfj3lNsVypErilO9mchyCLdXIz3lb3OpwAVqS1Tq37ltw6psupp91oAp98gcdTp1Ch0WQyNCYsWnlPk12wgQcHss3MqGTnUNIKiOGU71JDkRIJOz6Tn8tFfoxqie7VlOwuakMSeTMdLDmLXoIRovXaU+EIC8wkmF6KavLkA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB1039.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 02:26:50 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 02:26:50 +0000
Message-ID:
 <MA0P287MB226257A5122C1DD04632A0B8FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 30 Apr 2025 10:26:46 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: https://github.com/sophgo/linux/wiki is updated Apr/30/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <b9ffd253-839f-4cf2-b0b7-999f96ae5d52@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB1039:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db4c18b-40b5-4fe2-679f-08dd878e7691
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|22402599018|15080799006|19110799003|5072599009|8060799006|7092599003|461199028|10035399004|440099028|3412199025|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2hBeVNnV01KcWU0QW56eWpoRDM3T1JreEZDWHI1a2FTSlNCR3BmcndCbGZU?=
 =?utf-8?B?enphSUYwaCt6MGZyWGNyMk1LMGJzU3B6UTdUbzFpR2JldjM1Njd5RWRiVVVo?=
 =?utf-8?B?dFdNYjh0UDYreVVsS2EvNnVLWnoweTJyYWN6OE1jeklpdDFiSzdlTW1LdEpi?=
 =?utf-8?B?N3cyNjh2ZG5ieldPSmY5a1dEa1NNOFFXY0JCeFZjK1F5TGRreTloYWZtM05i?=
 =?utf-8?B?N3JoREpocHRjV0Z4YWo3Y2tYdU9oQm1LdjkzdjY5ek01ekVHY29sS2RsOC9z?=
 =?utf-8?B?WTZ0bDE3V0lTWE45THFYRG45c2xrN09MNHNuZG9XQTkxK2Y5emR3T2ZpVFU2?=
 =?utf-8?B?bE1pSDdnaXVRa1R0ejNqZUc0d2Fkd0pRMzZhT0RMNERqclpkaXo5d1NGNVdp?=
 =?utf-8?B?ZnUxbjZ3NFVRSnp0ckhUS1FCYUFETUd1ZDRNUVQ0bytOU09NcDJtS2laUEU3?=
 =?utf-8?B?aU41clRCWlkzRXFGSkU0K28rZ05SbDVHT2pMdmVKRlZZL1orL01DRnVpeGJQ?=
 =?utf-8?B?ZDQ0UGN2RWROZ21QRGN6NnRJeFhBMWk1bnZ0ODFwYWNmdUF0U0labVZHbXdr?=
 =?utf-8?B?V2JPdHNlVWVmUVVySldyL0dVOWYxeDEwbnpRajlJbndVcklocmRNbWJ4RDFv?=
 =?utf-8?B?Mm5scThiUUlQZXhjSGptVXR6bXRXZVpWRStFWlVsa1NaN1B1UnU5eFpXTDAy?=
 =?utf-8?B?R2QvWENSN2w4em13MjlBeVdRbGJmVHZmR2hpSi9Mb2xqbDBLK0Z1aElSdkVl?=
 =?utf-8?B?RmFvT29GYUJ2Q3gvRklXSS9OOWtnL1U1a05oVnIzMmhrTWFxZzdWMjkyZnJW?=
 =?utf-8?B?R1l1WGpGbmFXbUJPSzVpN1J0RDlNaWd5ODZVWVVGRzVldGJlSlkxZHJINmlj?=
 =?utf-8?B?amNsaFEvR2Z4cWs4cnAzKzZ6b1hBUmd4SGd3eXBCN2ZjTFdGaWRIakhxd1c0?=
 =?utf-8?B?YVpHVHpTMGJ4M0RzRDJiYW95WmtTS25RREFEQndxbWd1UTVBUUpHSGpRQUV1?=
 =?utf-8?B?UjZReWM3ckw4SkcxNitEYUcra2R1RkMrRTlzcTEwMXUzdU1vZVJFN2JCZkE2?=
 =?utf-8?B?Z2Vyak1LMktiMHk5UGNRQXlwcnNEWi8wYkUyV05TTWppZTRqTVBUVHlLZ0Vm?=
 =?utf-8?B?dEtvOFlrMnN2RW1HYjVoTFJsbHBYVVF0T0JvZW03T24vKzNxSzVobm91d2hO?=
 =?utf-8?B?SVhySTc1dFJ0bFA4ajFsK1FERDhjcWVPejVqNEluT0tCK24xZEdoZk55VEpQ?=
 =?utf-8?B?UkpFVEJDbllBZk52d25lQk9LMjNnZ2c0VVZKSVRicTJXa0Qyd3B6b0g1SUw3?=
 =?utf-8?B?SW1CY0pNWnN1TG9wWUovUS94TjI4TmJWSEVHWm5tdWtPcC9wVi9qN1RDK2RQ?=
 =?utf-8?B?c2M0V1hGZytYUUoxQ20vdzl6Sko4ejN1aUlUQ2ZhWWFHdFY2ZDA4ZFF2V2JS?=
 =?utf-8?B?ejI5dS8rZlppTjluQk84RFJpNGM3b1RyWTJpL1RydDFZUkFsS3E2czNWVEt5?=
 =?utf-8?B?cWQvYVRrWktqZ3RUSno3a3Z6bDJicTU1YzNlbzlpbFlPVEdXRm1PVzUwR2VJ?=
 =?utf-8?B?Q0xKRzNGOVNuMUczMjdXdk0ycExKczJVSzJoR2o1VWpRQVl2Q2loUVpqU2hM?=
 =?utf-8?B?U2dSU2laNVFDVWNVVVZNcW5iNVFXYjVOaDEveHBkelgxYTF5czkvMHRKcVdG?=
 =?utf-8?Q?Ax/JbRP0NqArJQaRqEp+?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjR3eFlqd2VTZzFDY1ZmSFZWUzhZdnhjZE96ZlZyaWxaTEZ6WVlINUhTUlJR?=
 =?utf-8?B?Y0FGSjFZSVRsdjhoRUlwMDE0ZW9HY2docldhTE91aUR6Q2NvQ2NrMHNta0Rt?=
 =?utf-8?B?Rmc5OGQybGc3blRrMHQ3aXE1QVMxQUlnNGg5M0RZUGk1QnoyWGR5dVFlY1kx?=
 =?utf-8?B?S1JFVVk1ZG5aRk5PcXFoVE40bWRMZStkZjlFdHI1RTlFYWpxYXF4blM5NTZn?=
 =?utf-8?B?N1lub2V6MjNTZlprUUtRaklabFdKZnNkTzgxY2lxWGhSblVGMU44aURjT3JO?=
 =?utf-8?B?TmxBcWFEL3g2Rll0RzM2T0FSSzRDMmpLOTg5QXBtcWMwRUI5UmhOcFQwN2Zn?=
 =?utf-8?B?c1YwZFIyZ1dMZTRIeVI0TkprUmpDOTJsMmJkM0Y4SWo3alBQdU5jK0wwYm9D?=
 =?utf-8?B?bWtOTk03KzdGOEZ4QWFMMlFPUll6OEdudUVkSWY1K2JiSWNIRVE1NEZRMHhO?=
 =?utf-8?B?bXRYUFFVZ2htMW9YY3lVMHpORWRSamcxaHh6cHdrNlBzcE1Da2hGT0liVDM1?=
 =?utf-8?B?WG9SbTV5M1JrN2l0amJXYUltRmVaUjdDZW1xWURGWTg5c3ZNRjdscVBlaVM5?=
 =?utf-8?B?K2FhdkJTM2Zxb05UNHdYMzlreWx5RTgvdEJOVDV1TURudXY3VDd4aVZTdXUy?=
 =?utf-8?B?V28rY3h1elIxZGVoRWJXWHJucCtMUjB6THlpQ1I1NUNDcUMweS9PV2I4czFP?=
 =?utf-8?B?bmwyZHRpckoxSGNUKzl4UWJOeFNHRG90SDExR3BUK0xnUUdYWk5ZYjlMOGxZ?=
 =?utf-8?B?b3NobUlnNlpIdnJBVnoxUVN4N0kxbDBOVHRDc21rVldLMzdWTXF3RVFtRTRl?=
 =?utf-8?B?Zkh4Qkx4ejlyR0p1blREYjBMU2pudVlVVUNjcVphc1ZDbVFDNlFqRHBPMlht?=
 =?utf-8?B?SCsxY20wWVBvdnp3aElleDV2WGtFdVpRUGFSUExSZFVDcGlCSTNhSitPRjNm?=
 =?utf-8?B?MHltdzBmOWpURzVSbVphWDR6VDBkS2NYYWhsVk5IZE5KdlFBU0JrUFB5UXhq?=
 =?utf-8?B?MitTeTJLSW5rcXE1MHo5TkFHR2RSc1hmeittOFloLzljanN2aTVTT3pjcmRp?=
 =?utf-8?B?dGMyd3VUK1BudUhpZzhNdWdIRmxscGR1alpYSmlRUHZ3OTNnaFN0clVqRUc0?=
 =?utf-8?B?TjRqZ2l6enZRaDlSWU9oSGNtR0svY1VIemZwODh4Tzc5V2FDZ0Q3M1l6d01X?=
 =?utf-8?B?cXZjQ3hqUEhhYnRwaDlreTFZTzRNUnJBMFIvb1pOZS9ERDZKNHBwRG5DZFFz?=
 =?utf-8?B?NjgyOG1BY0o5UThOdnRkdDA0dlFGUnJuK0s5V1Y5dWtpVWFmaHJVSUYrNE1m?=
 =?utf-8?B?NTdMVm90ekVacWZTTU15cjQxeEZpTGVsZFNJVVRUbDVCa1JrRSt1WUpkQVdP?=
 =?utf-8?B?VlJQZkF3VXRkMVVLTzlEVjVPT3V5TFYxOUZGN2dqNjgyVloxRHRpNlB1RFox?=
 =?utf-8?B?UHgxYVZmc2dHUjNlUUxKK2EwWHQ2dXNoRTQ5TkM0YzNCdEc4RDZhQWFRQjd6?=
 =?utf-8?B?RmdrRk54YTJJN2pNNjQyTnpIOFVJbThpcW9MeGU4UUtrS0V5dHVya2hlYmVM?=
 =?utf-8?B?bFMxVmg1am92VHM3RVFLdm4xeXNveFlsSzVSMWpJa1FCRVAyczZxYTkvWE01?=
 =?utf-8?B?QUZxSm9zUkR2dXpRcW00MndQcWV4TGg0UFptNDc0dUcvL1ZHakgweHo0bmFu?=
 =?utf-8?B?eHlzSkxONU1DcVRESUdsTEJpNGNEeEMrMVJaQ1l4MENHS3hqZU9KME5hNGIw?=
 =?utf-8?Q?rAOSng9XbBFjqAtSB4O1ZZdv6O6z/5QxNleHv5v?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db4c18b-40b5-4fe2-679f-08dd878e7691
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 02:26:50.4448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1039

Diff：

https://github.com/sophgo/linux/wiki/Home/_compare/fe2d813f616cc966390f5a8a99838b2347ae2fa4...fb8cdd6156badfd9aa00c588100a87e121acbd25

Wish you all a happy May Day!

Thanks,

Chen

