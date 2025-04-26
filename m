Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011036.outbound.protection.outlook.com [52.103.67.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7CE1922D4
	for <sophgo@lists.linux.dev>; Sat, 26 Apr 2025 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745653606; cv=fail; b=KC8h9TK+0Y/mn+D4GGnE+wXiIRsP1xpq4V3KYCITSla3l7RaeW5t2z+WmJwIJQq9D6kCig+mQu+NBw2kdtZKdviRqUEEfGc4EWX0igJUnrCKXCUjbilcVEA/sT2q7lmx3NsKot641APzW8SZpueFw+DUctF4KEHK1O0i64Eiff8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745653606; c=relaxed/simple;
	bh=H5+ROgCa7cDMbe3BHzyXUjNSmMLZafF+dh7tnUQ1BAE=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=PLkex/2uT3t0dTuQ7dDn045M9h31sjTvxHM4IQ0pTpo81fEo5/m9HGvsOEl95r0AFVNb8Y6x4AvsEYA4ksCkFRFKk+WnAhLFuW7yN9z51orzpEWNJVD13/TmaHxRnnTfTq958RRCzO+9q/VK4c+jHvkxX5Xij9QyoG+X4yslYAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NYnol5Vr; arc=fail smtp.client-ip=52.103.67.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NYnol5Vr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfshJuqnADsPGoTOFxGSeGwCj1myoL5nfVeYmIRvNGpB85FWcQ0ekXl+LMZ2b4SCSDX4wXzAGQewwjBMRdwrguNKB79CV4afWMP4QhgI5uGmPZYzuDHjmKugdgGSortCO2Qzd42JrfE/U7XZLChWQtdydAsPoyEo+oLiW+hVnPpNU0ktUS1qKWWlJPnLC8kW5sGEdoYmuYi1lj5mvcWbK+BTsIOh9yoQCGsb/lAaGB52MpiaQsIz1SubndEhlWZvBqmyLlkk6xv9gOnBYdPv2vGSIZ+PC45A7GQtXRKPhIaIxErrAm1nroqcNqVdAH2mRnwUFu7q4GWiWbxGCuWz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5+ROgCa7cDMbe3BHzyXUjNSmMLZafF+dh7tnUQ1BAE=;
 b=Bdeiq3dxIJYraFkNH8lJjYFuc9q/Uw7Ixr1oou952PGsyXmuPG0rxI6T2dc2FspQzT3t02NRbsEAR+Ri0y2leJlRv5QdoISZecMslV13zp3bQYMLScjsHBa6xibY2zgBYOUUSzt6dKlgtKHBe74fB9dSzcR9nfNb0oiOGgBe9oIu9f9oLNmzQzyUpm+VzsJIe0/leCROsUkEfWQwhBkEYOjpNv8YrFep7Htwy3yFKE0Xo+fmBog9eqT7EI4hhkcnguAcpozh1Vul1vDMX3hlVHhp5+s0S4Vo1acO9NlZUO8miu4tefjGol30kkstQLezna/9Deww7412turYtzQj5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5+ROgCa7cDMbe3BHzyXUjNSmMLZafF+dh7tnUQ1BAE=;
 b=NYnol5VrFeo/FT+Ql75wRLxfdZTG06WtlXwEGujttkhb60GCl8z30l7K9vuWj1cac93hmeShGfqXGa56vq3R/er8+GXovZUxKnyuJO2Ncrgx+Ry5Pj6OulpKddEefdFYlYKzfeAToPmOCYsfVDR08F9dbGHOdSU+Gm4XofEW6qUu2RUXLrgsB45HXdxraOm8ff2IEJSYUFCpzdzUDQEsZhzIGdlJDfAhXeckhleh+QxbwSC7Dbg1Uin+VM0tOyutprDm7Qy1MoSh44Iim6+FB4n8hpzjcrUtUOOfCHMZKZCdFv4YDu0phPO1YVoFPd4cn5f7jJLn1lo3lKPsNOVO9A==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PNXP287MB4130.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:290::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 07:46:40 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8678.027; Sat, 26 Apr 2025
 07:46:40 +0000
Message-ID:
 <MA0P287MB2262E949A30C7349763B8F53FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 26 Apr 2025 15:46:39 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: https://github.com/sophgo/linux/wiki is updated Apr/26/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <9fdef350-bf39-4607-a6e6-c53d022f0253@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PNXP287MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: d8323473-d447-41bd-0dcc-08dd84967b57
X-MS-Exchange-SLBlob-MailProps:
	uxBZ0XvJeHAmcrVv8d6gCuVw4bM+sLD7oyBcwkBfStrSliI3RjTwQptbbKoQDB0P+HcQRWVaIdewLrsn7KP6unhEr6iH3S7uU49mbHmQ6AqpNK7q3SvuSotD+aQtRdAKKKx3nlfmpdZHU19B0fopJl4bUd74KQaHTgaKhMIAj4nSODIQPviqBwZPTknlKteLOjr3XaVU1onqbzN/uqVmPvv1StWoiCtU5goJeGPlzdGgY+vEv5krj26G7jaT4SgBuiSuqy6vbOEEf+KJBnxTUTjmLNI5H0OPX9UylPHL9Ajcw8UA2Tk659WLgomKdgelMO7UAvrdRBMavqeA3Y5wUkHTyyRasZq+I25gNGirGh51lD0P4SP2UaxXi6IXHkEK3FhOtgxy9zeOPw9sSWWvvbrmuu0vkaLPpxqpMBYL8rNyo/yOjMb4pnBcKZZR9EDU0Ttfy0rlQ/Y544itEd7RTcnC473jZFwcKibgjZvXdXFsw93PHB+OxsDpIG3FuwAkDEthUU/XcNTeM/ZId/QfVadbG9Oa/ynhTVO6+f6soC50JuSnI0is3DxAOIAf1Tr6uLrJy80zKRh+te7fWaITrlqW3d65Py7lfmOkfOifSOl2Tsg7H0x2TW85VSxkaAMV6brcP7cRSiaryjrEu/KdOg==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|22402599018|6090799003|5072599009|7092599003|19110799003|8060799006|1602099012|10035399004|3412199025|4302099013|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0VtVW5mOEMwZkpyczNWenNYalUraEhJL3JXMHR1b09YY3AxZE5iMWd5L1h0?=
 =?utf-8?B?dXRJbGV6LytQQjM5UGkyN0tLYUE4ejhyL3FLUms5STVyWVZwMVNEL28ybFJi?=
 =?utf-8?B?WDJrMjdIWEc2TDROVVdUbEREVFh0ei9FaWNLMFFLY3cwRU5JNjZjOW4rRDVC?=
 =?utf-8?B?cC9tb3kwbXVRQVhrZzZKMnFDTEFvTmw0bDB0cVpLZ1RVNkFkWFl4RGtsWkJG?=
 =?utf-8?B?MDU4eFFuQitOV29wVTcxQ3RNdjk4di9CdDRuZEQydXFSS3RGMnpUYk9TQzM5?=
 =?utf-8?B?UitvcmZxNzZTZWNncjZZSW1LME9YbjJZbS9sbmNabkx4cXQvbCsvQ2NCakc2?=
 =?utf-8?B?NDIrWk0xUnF2OEZrWUhuMU44cExFUitHcXVhYUZDYnF1bkhOQXJBTkFOTDNB?=
 =?utf-8?B?ZC9TTC9zSDVUSnJaZThYYjRJYXBSNlpuNEVIaWhYRHVzUTBPOUJBV2RYdkJ3?=
 =?utf-8?B?aVVmMndBS3RaOGs3SDhmNHdxdHRZZDhoZVlPZGUxSjJ2eWV1bEU5ckVKeG9y?=
 =?utf-8?B?bUtxdkdwbUtLazRCR3lFYWNxMmxWN1pma25JbFExbmsrZEtVei9pYUpFNHZH?=
 =?utf-8?B?TXN4aC9Vbm5uVkphcEFEVnZvVFZvN24vMGJxVjRiUHlYMFJnaDAvNVZnWFBu?=
 =?utf-8?B?c2hnK21Ga2xOVlQzd0JzUFhJNFE5azdiUlpkUnJJalNZVlVpSXZJV1J6QUs5?=
 =?utf-8?B?MHZQUGlsUUl1b3VFNlZnSFlLL3dxNTlTTFMvRXRnekp3Y040eHlDdUVLcHhs?=
 =?utf-8?B?THdaM0ZIZFBPMkN6MUtnZFd2VjQvY0E2aTZjZ2picDZrV0VKdkZlWjU2Z1pZ?=
 =?utf-8?B?VEU1UEloTExFczFhQmJWMTdPZEFweVY0MjJTQmRPU3M2UEI0R3hVakt3UzZu?=
 =?utf-8?B?c2pTVmhsWUJEN0N5REVZRXdtSno5WTIzcGdpeVlnemZzbHAycVF4NlRyWUhx?=
 =?utf-8?B?VmU0bGlZVGptRDByZ0hsTEpiY0xvZ2JFZTVlWTl3QjQ4VFA4dEtoVnY3dE5Y?=
 =?utf-8?B?QndxRFhoQVpCUHpEWjhCd0hac1NvWU9yeGJnQmVxdU5KVjgzMm1JYlZKK3hM?=
 =?utf-8?B?eWRrdzAxOGExSmFIT0o4bE1oTCs4OFc1dDAzQ0FjVFJEUkl3enpNQmlwaWxR?=
 =?utf-8?B?eFRNVkNxRW40bHQ1cFBZcmdMZlZ3aW8xdzYvUGwwUE1sSHdSTmFFQVBaSDNY?=
 =?utf-8?B?NmhYbXNVYUd2MXVBZWdXVEkzTmhQb0Z1YUwvaUUvTUw0d3RJTWd3aDBDUnk3?=
 =?utf-8?B?MzYzdzNLeEhFb2Z5T05EdW02UUlVZkY0bk5WR3R0aTR5a1hza1dOVXZTQklV?=
 =?utf-8?B?WGhBaUVKVVNLVFd6Zllvb3pSWjhEMkw4V2VCQUZrb25UMVNXQmVWU2tMa1p5?=
 =?utf-8?B?TGk0aC9zdGFDWFFuNmVBWXZZNXVGaTFSZVJjQjhVV1JtcHRKUzhwanh5MXkv?=
 =?utf-8?B?U0dmWUxyKzdONEJMaWd0alNGaFB4UzdyUU5BMXJFbGIyOUxDMlJxN2JGOEty?=
 =?utf-8?B?M3hmU0Q5dHlWQW5YcVpDU28ramFzeEdxNU1UL0o1Z3hRSXA1RnE0UDBrZmc1?=
 =?utf-8?B?TncweDg0MzlzZVBpZkFoUHJBNUVKOEJjWVAvM2ZNTmQ1Z1ZNTGdFR1Q1OFdF?=
 =?utf-8?B?ZGVhcG5hQ1JXZXJtWWlDdVV2bmF1cnU1dmVUeE9xQTR3Q0hOWkhKcDlCK2RX?=
 =?utf-8?Q?RjL832g6zxLOQdcQhWSn?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmI1NU5SWm5JR2gxdm1VZUJyVzVkZmU0R3p2K2VpWnlhWjl0dUF6dGo1eFRU?=
 =?utf-8?B?aUpMdWhTSkM5ZzNxNlkrNUZoQWs0Qmx4RGFIY0cyODAyNW82OUtuRDl6V1pX?=
 =?utf-8?B?bEVzRkhodG13Z29GNmVzUXlzcVVWZzhnN1VuNklWSHRXdHd5L3NSUmhzR1hi?=
 =?utf-8?B?Qkk5a1lSUUc4MHZSU1FKNlVXRDZManJKclVESDBhdXZxVzZuSVVUdjg2Ym9r?=
 =?utf-8?B?WjUydS9iMHV6MTBhNzJHTWsyTUF6K0NDbEJ2SGY1bnhrY3d5OC9pMEJpM2ZK?=
 =?utf-8?B?UWs1YVlVMW9uVGVqZHp3dDdWNjlyZWJSeHQrUWIwQTFmcnh1d3l2a3gvWjdW?=
 =?utf-8?B?WWM1elBVUm1XNlZja0ZxSzVsTVEzOW9oaHhMalBvbEhpd0JJZ2VzZ3lrZTkw?=
 =?utf-8?B?RUFmUnVoMHlWeUtuVTJZcEN5aGhuMlBnemY2OWxveEFEd2c2WUl1ZkRzb0Z6?=
 =?utf-8?B?M3RQUEZ6ZWt5WHJxWWt2bTduUW1RZFp1Q1M1bG9FRVBpNEI2LzZpSHB3NS9o?=
 =?utf-8?B?UnVDVERzWlhJendTY3ZBNFhyQmJLUTczaFpITlRLU2FHbE53MGtUSmY4K2tU?=
 =?utf-8?B?ZHhzYVIzOFpVZEpkY3YwUldkUVlOdFRtMlRjK1c1R213QUV1dzRFc3RiMGR6?=
 =?utf-8?B?d3U2WWYrRE9TYkhvV1JvSERBNGwwR1A4TkZYWGZrMVB3dVVGczdEbzVSdWxi?=
 =?utf-8?B?N1R6eGRNMUlkTG03MTU3VEJ1NHRlVG04bVlDYVdSeUNLVDRCb1hxRzRqN3Bv?=
 =?utf-8?B?SFlMZkhGbUpBcU9pcG8yQzN3d3BzbXBMSG1pUHJvZWNFZDJtSm1kb0JKQ0Vp?=
 =?utf-8?B?S1FzNVhoTnQ2WHRqTGpNT3VsNm9PNjd4L3pzanV0NDVYM2hJUVBYdk1JZGpw?=
 =?utf-8?B?NFJJSzBpYjJQelgxSCtLNWZPWnRHZjk4cGJjdksvMHFaejBmcEF4Sjg0aVRv?=
 =?utf-8?B?N2d0cERZUHlDb2w3Wno4MXZkc3FFSWpvaGpMYlE4bStzeHlGVHd0VnRrdTU3?=
 =?utf-8?B?RXFXNDdZK0JFNUNnZmlMK3F5Y0Jnd0pFeE5BTno0S1JUaG9WMkVSSWZ6d2VJ?=
 =?utf-8?B?NEU1UzF1R3BVT1BjVHZSemJsZUN4TWZ4SkRFRGJHVlF1MnZpYmdQNHp2c2Rn?=
 =?utf-8?B?dnBuU2dhZjluYm90RnluK2NmWFhMcnU1V2FlT1p1ZHNoaVVWM21HTEtLU0FB?=
 =?utf-8?B?bFgwcXBCVVpSbnVLSFR6RHA0RUxTNFBRV21BZitPMzExNytGZmtKTG1pbjBM?=
 =?utf-8?B?NSt4R0xQQ1J4NEhKZjZlNmhZYmpHQzlUMTYvZkNXT1Y4cUE1UU5ncUhzVjFJ?=
 =?utf-8?B?NGJzWlNXeTVWbUhrK1d5Q2llZEVjMm1GdHNEdzdsYUNzMmNxTlBET3FvT1Vz?=
 =?utf-8?B?N296MU5ZRkp0QndxWDFtRDNoRlkzV0ZzLzhiZm5MRHpmRXloa3MzcEdvd2VK?=
 =?utf-8?B?QnY5dFhXckhSNHRuT2dySG54eXZOZHl4dXRLUm1sMkh6bTVDZXBRcXhudG1C?=
 =?utf-8?B?KzAxZGJxOEFLbkRUSG9MTUxvSDQ2VWtSVThncitQbHd5NnVHTHpnd204dDNH?=
 =?utf-8?B?ZDdrcW5SYjB5SnZpd2dYUENkZkZtVTA1bURtSmtZdUdteWxaalJqMWh4RFpD?=
 =?utf-8?B?VXFmUzdiTW9vMTZtcWJMcmUrUmFlNElvQmJjN2VHcE5oazh1OUZBMzFMUk4x?=
 =?utf-8?B?L1lUOWZMckh4NjdtOFNRQnNFUXJPQ3ZVSWwwdFlaV2RZT0hxM09sS0FJcjZB?=
 =?utf-8?Q?teaRigHF7G+8IAxfu4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8323473-d447-41bd-0dcc-08dd84967b57
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 07:46:40.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4130

Diff:

https://github.com/sophgo/linux/wiki/Home/_compare/09dbe035d6e39778f7f0dd5df6d0d2ba8cd94f1c...fe2d813f616cc966390f5a8a99838b2347ae2fa4

Thanks,

Chen

