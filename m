Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011039.outbound.protection.outlook.com [52.103.68.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115B62D73B8
	for <sophgo@lists.linux.dev>; Wed,  3 Jun 2026 06:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467477; cv=fail; b=UTxlI/jyt/1hQRP7AcXo5XDDifUblcP3AMBMcv0UB6dWTfILjD9BnTdzJ96Nylu7U5M3oKDz+agj2rEY/I7JKUx3k0C4mzNzqhDkX8BG81S+GLAkDYDKjYNb52f+4bFTxcDHQNQKsS0yMuBbXRj9DtN1g+ysyrQYl7WqOtOSgac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467477; c=relaxed/simple;
	bh=LddQ2Qv+hr/QGy+y5bh0KKTRT2mSS9V0jH+3icsBk2Q=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=QHwJJ35/D7XlWfPViLh7tJL9yyMBLAcQ56UPFBEtiF6ecamKpB5qOcUZfZdDRrr5l3oCCMWypJsWSP8V438RSoHTyTukGWLYFv+I7i5ENoejdr5n/1DUejRMDDVuuaUwRZ2sXvYxPjYsyIPLK6MCIUURLJCSmjaVqUe2bGg05sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hSXiuoEE; arc=fail smtp.client-ip=52.103.68.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="hSXiuoEE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zqd/8xZgfTdMMijzAR7miocvoG/2LRTRqtTjkTYKIhSqgw4RGD+GDI2TBjUPSvpvtjPfaips+HxTULnNIexIuvSuOHKAOYMDmYvdrCA66zzWJxdMVeP/QlP0HOtkmEm18Ndj9LKIEwL325v2NsCgS9OCc2JPPUSsYnkqYJkvEqwL1FCQzbio7TdjVW0JMKBvxpIqesr6hPPNJxe1DMnHX+BDSNTVo7ueMb8VOe93sePEZSZl2BRNUF/GlT7Jp9fMB77kTgTWuhJr/khLnyxKiJK5IUjd7Ww7es3EtunwGTSTx9I6qw7yJft1f9klbNs6l3eux24HV6vcTV5GcuVJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG2FsrK1mTXw3lxfDoaOeiWWa+iK541Z80lf93+rIF4=;
 b=JtiTnMFwsC23hu3avry5Ps6D7T8dZtfiaSuJ02NKTpABhQHQc995OtB6xMcthDvNKsNiU2ZcxT9FwrxePOn30FDmSbs4fRxUwdNzYYvcJxg+swwoYavfNElgn51vS/38kboku903GPPSb7+pb31PVThfPuR3ydc+qu+KtnUEwdslq/tWoDdMrraagnk/XXSUczoayoPe1lvM9zOPpfelrILruwJxEF0lpZwxliu6klSKEBot/K2FmzajvTMrhm0YmzRDqoZr3ojOhW21swwql0bWaXHdji1+fViU4uCrqWxM9a5Fm1m7xzLG82ZNECpTCCn1RhDgFL4k0S75XdLj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG2FsrK1mTXw3lxfDoaOeiWWa+iK541Z80lf93+rIF4=;
 b=hSXiuoEE4ncIJ1h4L+ttPY1vjXUW56M8il2/G76Pls9NlZz5CwilCh6I6yipBmAhcxSfrPyru9QwuYgpcp40kZAX3cbV16xiM6lliu536ijv6+OOqhrFEBkrAeiRVUyEv9BB776GCyojmAyCy3vRcrwXXw0P95uTMwpPRDct09AwWBxrFUUv336g0qZ2d+9n7tJbfNVtfu0+Z0WCyg8O6AyZPl/+lvrIqy4saDfIV964HT9Jculiudu+xh4JqPVItZTrENw3keFo7aRkQpV7oOMQBGhPfKQuzmHk3dF53SRpHPMQgKRRBdOyRee2DHtZlTdXszegqCysd7x5nPrD+A==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN3PR01MB9872.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:171::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:17:48 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:17:48 +0000
Message-ID:
 <MA5PR01MB1250024541E71412DDA04B4AAFE132@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 3 Jun 2026 14:17:42 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>, Han Gao <gaohan@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Chen Wang <chen.wang@linux.dev>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, Joshua Milas <josh.milas@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v7.2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0002.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::15) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <f753d849-646a-46a4-81ac-9bec1d0875ed@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN3PR01MB9872:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3117fb-aa40-48b3-d171-08dec137d52a
X-MS-Exchange-SLBlob-MailProps:
	dx7TrgQSB6cUe9t9Fs5HiWpFB4Son1rThDsT5s0bDrrcDFrizuIyvdxXV71tVgUc7w3iiYwPePtsxyHfZvnuusx6b+cqj12USBjSkEPPHemeO1QpbqIwk7vl2YFfBXTwx7omQlCRUs/LWugcf4TIWrhsob+nTze3WqWuel7CMMddQ6H7/uqMD6Mm8HUPHnjUUMST7bnm4/0i759J44cyXKWYq99zNoIT2U1I3E20QPgsKupWfmGJb75PtV6Cp+Jm5hmOM9PViEhL0PqTfVSPlkVcgoukqMftR+KSnR1b7jklar0g+mUp3+zObDcc600vin1deNDZY8j2Vq7HOP1UWIunz1z7rZbpopoAhs2l9yQuvWjq2KFW07OlhIDglQKKmBC4WlRCLnm8kG4OzAIp1Dm72KEZ4Ju4KZhZY/sDqpJg+gb5C0qq4s8JwedUQiKKlCHkGqug4oa8HEu6jfJdnsOcwzdJ3lB4EJaZmS9muyZ3VSx0SU6BURpNt01A6gmcglRjzTWGzKlUwc3bIoZ/A0lZOSI0cYsZznowQOPIaPrqK69qP3bxTEgcTm1TbhuVwmxmikcu+RKB/nVQTmWSP8K1tiw1i8/EJv5FrOp6pxO/1JPhFz+cv6aE2Ws+3C/xWVXWnKy2/czHFomEj9q/CJvOWAHdeUdvmrFMCEF4mspQ9lw9By60sbUs8hq2oxizdS5CLMe+7kK8eJqMkw4JFXNxRjy+Ng09NxJFpHQqA8FLJulPc38Cz+MJ6OCEf7q5Tt96tu7tAS8=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5062599005|51005399006|6090799003|24121999003|25031999004|22091999003|8060799015|19110799012|23021999003|41001999006|5072599009|15080799012|40105399003|10035399007|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzFiZ3Jkanp1RmdOVXpKM1paR3M2VlpTLzVvMWdvd0dnaEpIQjNuRkVwL3px?=
 =?utf-8?B?Z0d2emZIU3QvMjJjUUVCWGFiY0cwS3JsczVsYUVXRUhSd3Y2cHhNdldyUmtZ?=
 =?utf-8?B?dHJEYzRsR1NDSGt6OHJSTVJXaVZHdTNTMGZNaHFpYVMxWEY5U0diVlplOEJo?=
 =?utf-8?B?ckRoUkZLVThzelpkOE5aWm4rTDF3T3RrQkptbzlXU0E0TkpxM3dOZ3ZLTXdv?=
 =?utf-8?B?dC91WElMSjJmTE9rMnhOdmptcFJQN1NjZ1pSdzZnS1p3WVcvbUhvWnlzZ3BG?=
 =?utf-8?B?TnZzUForL0V4RllodVlGa3F1Q2t5RlJwUUJiTGJZWlZidStldWQxZ1lCOGV5?=
 =?utf-8?B?aFBONEo4Q21SWVUyS092VjVTMklEM01BSEsxWGYxV2JrUHNIOERCT0VaRnEw?=
 =?utf-8?B?YVFHSGxMR1lRcWRhbWNxREx6Nk82V0dKWDk5U01iTFpLSklTYUtIMkdWbjIv?=
 =?utf-8?B?aDM0Sld3MXAyTUlBNFYvdFQ0SDBOM2VCamlocXFua0IrU2Via2dyNU5pWGpY?=
 =?utf-8?B?THFWZnhqZnIxVUlHQTVZM2VtTkRObmI3RUw1TU5Mcll1K1BHaEUrU3pZZlgv?=
 =?utf-8?B?YjV1azBtVDVoZExGSlZoRDYwTnpWVTJoVkdqRHJSbHpaUFY0cG1MZ29lUEVH?=
 =?utf-8?B?SkZTS0xlZVdoUXB0UThBMXpWQm51S3BIcTFST1RFclVUSlpSekZ3bXFXZGx1?=
 =?utf-8?B?aTloMHAvN08wL3R2T1lvQkxBQmNXODdnYkdVa0VHQ3gwTko3OEhqVmlBREdM?=
 =?utf-8?B?bmhFN3lHSzFBdGFHQkFGQ3lmS0Y4OUdKNzlOZ2ZTVmtlNDV5bllFR3kzcUtx?=
 =?utf-8?B?RDlJbURCM3VhQW9qVUhUU3JXazBlTGdKYkVkTkZ4L1dHTUZMS2tzUEp6Z3U5?=
 =?utf-8?B?RnFBWHJSUEpPaXNEZHZrK01OZ1dnWCt3czA5ZE5PdEVCWjFVVXJKZzQ0Qm5n?=
 =?utf-8?B?S1AxQ05XbXVOR3h2OC9HUUxLNnJPVzlLY0JuL290UTU1eCtCbGJCRThTaFhm?=
 =?utf-8?B?SlJnUlV4ZFg3cDE3djJOOUU5c1pZb3F6ZXFsMDZiT01NSXYyM2JnOGlOblJo?=
 =?utf-8?B?WmcrTTdNb3k1T2RDQ203ckljL0tkNjRBdkRRL203a3gzcWZidFN2anJpVGhL?=
 =?utf-8?B?bzd0Z1ZJSUF1ejlBWURDa0M4aEJiUXFsaXJYVjB4eFErMllka2s3dEF6OEor?=
 =?utf-8?B?a1NUc29RVnl2c1VkemxpRFRJT09WSzMwWEYrZ1FwZGo3NStiZGQ5YlV3eHJx?=
 =?utf-8?B?NURSMXRLcWtBb0pQNG9VWVh5OHUrWFQxVWR6czdHbUdkbnpFZllKTFE2eUhK?=
 =?utf-8?B?VXY1OEtXYThlQVc1K3YzU2pHVnkrWXdWcjZEbllmaVBKMFp1YXQxWHBCNG41?=
 =?utf-8?B?WnpFc1BQdW8xSGZpR0JMM0FLYk5ndWZyZU9KdkpMMy94NlNQbkJrZWVXL3VK?=
 =?utf-8?B?Z2kxVmsxYTFHMTJOM0JONVhkcUhheUNLaEswYVVFSEx2OG0yM3U2M3RyaXAw?=
 =?utf-8?B?Ry82d3htWnJFSUQyT0NvaFc2WUxBeEhLVXJ0Z043M2xmN0l1cHNBOGN0ZnAy?=
 =?utf-8?Q?TpqD8OiWiqk9Op05VyqUUl8Gj7XtKnNKfrsEBwjkgFob5i?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2IyR05teE5mNHduOGNDMFY4aXJkd1VtREl1Tno1Q3h0am55R3cyaGRBYm1B?=
 =?utf-8?B?WmVlbkFsazlLWExnZG01dHUwRmxwa3dLNDJtUXVHQzJKcEY3QzUrQnhHcm9U?=
 =?utf-8?B?VTgwdUZxb2VlblNqVHJGKzdteWp2NG5paHNwMm1GT2tXZEFaTzY0NXBmVHMy?=
 =?utf-8?B?cXpoZ1dKNnpLZ1hyYjU0a2lwTUtGWXhGVW9nTHUwOGt2ekxMNHhHS1V3Znhk?=
 =?utf-8?B?N2ZHL0V1Wk0xWVM5T0ZoMWVHTlFEdGlzbUN0N1RGWGhlK1BBSEJ1WTJBVVdW?=
 =?utf-8?B?OXB5d2VJc0l5c2FjQmg5MjM1cXBTWjNNd0prUnlLaElpa1ZIOXNOTWo2Njdr?=
 =?utf-8?B?R0RES0Q1Vm1tdnNtVTRHdE03THh4djdWU1JvbzhEMDc2RStZbWJ4cjNNcGlT?=
 =?utf-8?B?cW10bjNwMDZnWlBWVTJCZ2FhbFJlM0ppWjUzUXd3V20reVo0a0tDNnZMdENR?=
 =?utf-8?B?dVJneXZUWXczTVkwd3BCK0pWZm5zdVVYUEtwOFJEMkZNMFFzdDByOXNTakNB?=
 =?utf-8?B?TlhOTzBuZFU2eElhK3R2dlpnbUp0c1dGQU5zcWlVWGpWckQxRmNiU3BaSFZy?=
 =?utf-8?B?S2wyd0RaNTljL3c3SkF6MlpwRlE5NGdQRjBGK2ptQW5yU3pVVnQ4dWx5UE1B?=
 =?utf-8?B?VllzY0tDMFVNZmN5cW9TR2Y2K1B4b3BtdVZUYU1tSE43cFBmOHN2UlBSWU5r?=
 =?utf-8?B?RThRY1lYOGgyQlZQckk1bGFPTmkxTC9JT0VSSUdJUVcxbG9YVmpOY3FzUEZp?=
 =?utf-8?B?YTBiaTlPRnhSM1hDNnkyWXZHL3BOeVoyaHFKeFB2UG90NHBCanFoSEw1ZGFR?=
 =?utf-8?B?NVd6QSs4VDZNelZiSEcxV3pzVm1tL2JDQWpGNTg3ZTFWT0UzRDBNSkdySWVL?=
 =?utf-8?B?cElSOVJobHdQeVFhdWhHdTFKZTllNDBVeWcwaDZDUGxtbWtJRHFlYm5SOGJH?=
 =?utf-8?B?NmxESXpPTEZxcUFMM3M4dEpzdFhNWGlONVhJTXJhUEZkRUFQVS9vNHJtQ3BT?=
 =?utf-8?B?blQ1R01pZWJMTkViallNdHNySndGQ01Td0R6eHNWOEVrQnNyQS9aeDNVN1Nu?=
 =?utf-8?B?T0dLTDJ1Mlpudm9la2FVanlqZXp1QmRkV3lwMHpWUkNkQXNpdVRjQkZ5K2tK?=
 =?utf-8?B?Q2IrOVNjaXFZaGJuOW4rQWQwd3g3bTR5dVVmbUFTUm1VZFd1T0FBemJGTTBu?=
 =?utf-8?B?Y3l1Vm9xV1h5L0tNNDN0VFkvZnd6TTlKa3Q5aVNrMUk5K0dpcDFFNm41RjBB?=
 =?utf-8?B?anliZEhXR2QxR0JudE5LajFxc0VvZWpzcXpvNldBbWhJRTc5U2tnYkVRNGZF?=
 =?utf-8?B?NURPNW83Qk5FeW8zRXNCMWhYU1c0cnBLWlEwVHAyb1BpWG9RWUlZKzQxMUx0?=
 =?utf-8?B?bDQxNGRuTFNmdXI3dGMyQ3VaM0cyVTNYUU9oZkY4bnBxL2JwVmR2ZnlIQ2Np?=
 =?utf-8?B?SGQ5OWVZSnpKTGcxYTE4L0JoL1pIZHBIZkQrTWdJN3VwblUzM29JOENMdXlG?=
 =?utf-8?B?Q3ZpanhHQURDV2pYK3pGbUxxNVAwVVBwemhkcUtuRzRZQm9leEN1RmdHUzFq?=
 =?utf-8?B?UExyV3ZaSGlpUGh0WG11WkR3bVhOenp1K0c5dFdkZ2FlR3NmVkwrWmk4SW9x?=
 =?utf-8?B?Q0xWTE54WWxESm1xbVFjYkZQc0V0TFRVWFE3QlhWMkxjR01vc1c5QXUrS3pn?=
 =?utf-8?B?ckdzSEhKdVo0R0ZUamEzNFIxSWxONUJTYVM4NzFYdTRYaVJsWUd5ektrUHln?=
 =?utf-8?B?elNTeWNaTVpqL2VnVGlsSWRVTmFLTml4dWRvSndZdS9hcDkyQXl1MVNPTjVV?=
 =?utf-8?B?TU84TDRwcjFoSHN2azFTWEFFTlFwdnFQL1VYY25jeXBjSGRFQnZ4QXQ5d0di?=
 =?utf-8?B?V1RYNjJEMzJXT0FDVFdaMHphY0xOZWJhQTdaWGpINlpESmxiU0lSOHVFcGIy?=
 =?utf-8?Q?E73pZ+xXlE1xlmpVLpwJn7y9KdCyOiVJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3117fb-aa40-48b3-d171-08dec137d52a
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:17:48.0562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9872

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

BTW: Next PR, I will start using my new work email address: 
chen.wang@linux.dev.

Thanks,

Chen

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v7.2

for you to fetch changes up to 903a9364e40563faf4730dc63ad7446246f494ff:

   riscv: dts: sophgo: reduce SG2042 MSI count to 16 (2026-06-03 
10:09:38 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v7.2

Sophgo:

For CV18xx serials:
- Add bindings for Milk-V "Duo S" board.

For SG2042:
- The CPU unit address incorrectly used decimal numbers,
   especially for those nodes which value >= 10. Now
   corrected to use hexadecimal.
- The MSI controller actually only supports 16 interrupts;
   corrected to match the actual situation.
- PCIe RCs are cache-coherent with the CPU. Marked it out
   for RC nodes.

For SG2044:
- The same as SG2042, use hex for CPU unit address.

In additional, update Chen Wang's email address for Sopgho
SoC maintainer.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Chen Wang (1):
       MAINTAINERS: update Chen Wang's email address

Han Gao (1):
       riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers

Icenowy Zheng (1):
       riscv: dts: sophgo: reduce SG2042 MSI count to 16

Inochi Amaoto (2):
       riscv: dts: sophgo: sg2044: use hex for CPU unit address
       riscv: dts: sophgo: sg2042: use hex for CPU unit address

Joshua Milas (2):
       dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
       dt-bindings: soc: sophgo: add sg2000 plic and clint documentation

  .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
  .../devicetree/bindings/soc/sophgo/sophgo.yaml     |   4 +
  .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
  MAINTAINERS                                        |   2 +-
  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi        | 236 
++++++++++-----------
  arch/riscv/boot/dts/sophgo/sg2042.dtsi             |   6 +-
  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 236 
++++++++++-----------
  7 files changed, 248 insertions(+), 238 deletions(-)

