Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BBA1B983F
	for <sophgo@lists.linux.dev>; Thu,  4 Sep 2025 00:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756945374; cv=fail; b=JCoqyq1fsaN+QF1dcePkEHoeIoB8ndZ6xdJYPu1p1X/JDPQbxQZvYq79vuB8CeJkedQccifjCJ2K5Nfcbr0uv71OPtVR9vL6MKU09RbSylDzlWgkzN/koGZybd97pgiDgD8xECaRInCDVMNcirF/EZyO3FDYaZ6KA/LzZDLaYV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756945374; c=relaxed/simple;
	bh=EBrw42C34VgRZ//CDkjU+IlQFqFJBAAfcKVLTKnOwqM=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=rBauFYXRbpxbDaIItlmBbSkSAWV+4JGG2jZqm+LXgIAixNJk5WgyqnABQqM0kd/3sO1zE0Kya+71jz3xa+Lxc3cNibGfHSknlolbe/jcJwElS+X8iOB75bxv+RmTq+sM4HRZNesSqfIkHwsnWONzi4U6KtcHN+Dgw+3jZ6nkSVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mTZ/WBgB; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mTZ/WBgB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvPPBA3GokScHrnJ8BBQYXE1Lo1h+cQDj9IBizrN/l0aHC5Mf8hoZzcV+LRbunwoLnEyYq3JWvWLyyrRRzWvj859o8gtGlfSNaDk37VJXnLP8BEvN26nHHrCHgAd0xD/wentIsOEbs1HaH7ko1B6cIl9pra4kTmbZUoM4rb/iYy2izmAL62dBMc1f98kXFHHBV6sHckoTDAU/7HS3QKDyupkbXNv8LFzeaanz0TA77/vuVfh/R5O9l81EayVujNA789GcEgBhwt9woWj0SoBbQUfrYlpCMq9PDS6fntfcQuLlbm9v2OcSleUVlTah9QkARTcUBTA6maabj9EhwKsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeJ5NqVMn45W6D+GlimuncBZ252yT6TX/FwFmqbWW88=;
 b=qeubQ9e//jicakAc/BsnApfY1MbqxsINyNr4A4Tn+sIZHykLPB8l1+nCJLPxFpNiEWxT65jk84xTGNQXELaX2AeFUyuew3aYYqqfsRUEKiLgAbpWUftvR/dK/6MLVsXTl8cRy19D4MWiQbC62LiKp9SnUdp9zDT8jb+yWSxOEUQfVy6PYXUXBNvL2i6Qp21+IuuklQ7WW3zvDp+uDOQf/epf4b1sTs/YpW1FwPBmfC1pxY4mG5pKG1XEEcrcRPdDmoDZ07ADy/adz6M/lSRzI6yyTyRcAUMjKTmbnnvO5NvyahUvAMBiAd7TP29sKcXJRVcuF/FTxMFERShX2QRYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeJ5NqVMn45W6D+GlimuncBZ252yT6TX/FwFmqbWW88=;
 b=mTZ/WBgBbDnwQG2FYJdxTOUMsjlL01ETAucp9v/1XlnPIHPNoJhLHMjtlUCXnUZwznaUTImZ0UMkbF9jk/phcgMiA7P7zGz7PNEUKZYE9eYvMLqV8dFtjP7DWr2Ux/rmgNZ4glET9L05aGsBT6wv2kyfE5Pymv8rWcZ2UpH/algnkVZiT+r/FUm+tKyujCo+1d9HzcZBguKJJ+SavMLSs+WLTs1S65sExRW3ht02iFeuk+Z7WE5tdNPpaIBGlqpb1m0QyGUW64w7ylLV3Xh1v+bGrYYZvFivBpUwKRRsXWPrwgZvfHv9lK80UzIw4+y7Gukl29rF7A0+8ZILX51Eeg==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN3PR01MB6626.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:86::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 00:22:45 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 00:22:44 +0000
Message-ID:
 <MAUPR01MB11072040B73B91A812619171EFE00A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 4 Sep 2025 08:22:40 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Sep/04/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0157.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::10) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <4c5347a9-d328-4538-b42a-16544b6cd868@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN3PR01MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: 578bc5c2-e824-4126-fca4-08ddeb492af1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|6090799003|23021999003|8060799015|15080799012|19110799012|22402599018|1602099012|13041999003|440099028|39105399003|40105399003|4302099013|51005399003|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ek55T2RkWjJIZ3YxS1JaekhzSEJoeFB0R0N1bXNMZzVWcjYweFVHSng1b2xG?=
 =?utf-8?B?Z0VzQkE3NVRnM2VyVUNGWjdFNUQrSEdvWksxeDN0RFBRRXZLTmxKdy9JYUZ1?=
 =?utf-8?B?b040NytxYUUrSVhtS0xKa1Qvb2ZqM3U5Tm53MlJoTUkrcDZ0dndUZjNIb2RK?=
 =?utf-8?B?OG1uS2JvY0EyaUxxZHBVZ0F3WWJDWDBWZFRMTWJMQWVWZzlDTVhtV3JkajVT?=
 =?utf-8?B?dFFOUGpIMGcyZEdzd3FueXN5Zi9GRyt4NDRHOC9FSDlqdDVpa1RKUjl2NTZq?=
 =?utf-8?B?Y1gvYmRFWngyek41QlpQQTdSZEVRYzZpengrQWN0ZWJ1YjdFNDd3TC82NDZN?=
 =?utf-8?B?ZC85b2tuZHdnVUUvamxjV1RUVHJnUk9QNWpvQlg5cUEzaGZQdW50Y3FUb0tT?=
 =?utf-8?B?alNZMEp0OGFVS3FZRTZUTlJpN0JrcVlIZTlkS1IxdEJtVFhEMEZ4elVPbDZ1?=
 =?utf-8?B?Sk1LcG1lMGxsR1B3QlBCUnpsWEhNUmZvMjRNUnc4U3AzYlF4OWVLeDhXcUxx?=
 =?utf-8?B?bms5dU9obW10cnR4NStTZ3gwUC9LemNET3djMzhvUVZ0c0oyb2o0SEl0bVI5?=
 =?utf-8?B?NlpVdGtaTEt2bW1xYkFNOWozbjJ5RTNYNzlBMExzUkVqdzBZVGRrc2tOZDl3?=
 =?utf-8?B?Q3NRME5DY010OHhsNFR1VVYyT25WdE9Ma1pRa0F2ZmwwV1ZlMVBUQXRPTk1m?=
 =?utf-8?B?SDhYVzhlU3BRc0hkV0JSalVDM0UzZUJVYTNBMWNuekZZQlB2Q1lQY3FVSE5Y?=
 =?utf-8?B?TXRzYkVTUE5UK0ZJWDlIQlRGWGxEbnZxUWpLLzVGd0d1WnFFRVpNV0pOTXNJ?=
 =?utf-8?B?cU41Tmd6ZFJxdGo2WHd6bkNENE9PUG1wak1qc0lMTkhjRU5LdnhXVnpKZkh5?=
 =?utf-8?B?VFRQTjJxaEM2TlRYWk5XTkpBWnQ0dkFpRU56VzlwVVBlMTZJTjBZWWdWVG51?=
 =?utf-8?B?cFJVWnRTYStUdzh1VHJyYjFCUDI5SVpnc2lqb3NpbEJrSzJGV3dUaEZVTkdO?=
 =?utf-8?B?S2V0WEtQWEdMYWd2WTRnMG15bmZ0UVIyU0wvVXl2djZWM3hNdG5ESzZaQyth?=
 =?utf-8?B?UEZNVlk1TkJreDEzdFUwditTRHdic2NtUS8wcjR3N2JqUG0zaTVkc3czYktL?=
 =?utf-8?B?SUJ3S1FPUTh2Rk9UdEduV0VrTEU3cTI4TW53TzliSmVIYXVTbGU2T25zVE9C?=
 =?utf-8?B?OFh0cTFPYzdSVDV5Q2Fac1ZoeTM0WW9tc0NKSlhkbFE3eE5KckVGTGtiVzhG?=
 =?utf-8?B?S1FKSWJWUERSL3FOcy9LMjJZdWhDbXIwTnd1ZXhEZVJzMW05SmVGckRaY2Ix?=
 =?utf-8?B?SHRtdDkxTFJQQzZKVXBKLzBQRkdvaEdseUdEZjNLMXlSNGF0cXN1QXpuejZj?=
 =?utf-8?B?TWhPSDNoR2QxRmdWNlcxejhwTm5PRVN2ZWxyb1Z1bC9aLzMzT3Q4VGxhVzRB?=
 =?utf-8?B?OWxuRkRELzlqcFAwZW9WVDEwME4xZTc2Wm9ndFlQaVBmdWowQnMyOVhkcno3?=
 =?utf-8?B?b3RhYXFIZkZJK0FDUks5cG8xRjRmODNlV2NucUpwaHRxTFhMMjRUVHlUQ1lB?=
 =?utf-8?B?YVdMZzdkVE43QmV2WWtQSlRjeWI3TVpQWVB5REdQOXQzdXNUREZ2SHdTbTM4?=
 =?utf-8?B?NEJFVE9kTGtqREFobWUwVE9NMXlDK3Q1enN4TWZ2VlF5dm4rTmpJU0d3ZkdH?=
 =?utf-8?B?R2RRRVNJOEFPNjYrRzNQZEUwbFRwMmR4Y2VBZkFTVTVoN0kxSG5Lc01BOXc5?=
 =?utf-8?B?QU5uZU1lZHN4emk5SXJGamtuWW16c2w4QWppUEpWczV2U3dQUk5KSFptZ3c4?=
 =?utf-8?Q?rTo9pEN0jVBpu/2bwqAroYZ/ivvtVAqfYenAA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2ZSZWJCVVZZNDVvVndEQUFSYlA4aVJKTGZvN1FTNGw3ekgrcCt0U1lmaVJR?=
 =?utf-8?B?OXA2K0FKbEhnU2VMR1VMNGdtRXRmVlBhU3p0OTBoeC9VZ2FzTUx5b2lPVU1F?=
 =?utf-8?B?MjBxb0tyWFFVRldibHA4YnNid0NSbGNNUVV1Tit5UzgwNWNtSlgxTnp6dGFi?=
 =?utf-8?B?K2FkQlNHM2E3VFZEUkRRdEtGRFVEK2VIblJCQm03UVRGQVVVamNHdnJSbHBL?=
 =?utf-8?B?MERjeVgxNWVwUFNyNEcxc1R2UUlJa1M2M2ZHaTlHZy9rVGRkdG4wTFpMN0lK?=
 =?utf-8?B?S3BoL0JaUFdLL1RHK0FoaUl4dGtrSmdyekFxV2xoSmd4K2g3RXlCTGRHQ2RW?=
 =?utf-8?B?YnB3d0k0bTROamVZQ3liRkI2eG5OZm1FVEpiS2EwdkdwMmFmYlRKNDRhYkFx?=
 =?utf-8?B?VTRCNVZIVjFpTkR3ZW5vd3dPeXVSU1lxZXZtUlhaSW5ITk5JZlZJQzJuZnVH?=
 =?utf-8?B?NnBReDlGYXd0d1IzK1lXUENTMEZXd1FhRWNucVRaWnduS2t6Q3ZUK2FLSUxU?=
 =?utf-8?B?L3JOSE56Vi82b1dTNGxnTm91elZua0hzeGVPMVdNanBJdHlveHFGOVdvMEYv?=
 =?utf-8?B?WTdhQmtNTXRZdmRscFdoU3NmOWxmVitZQ2dtUTMzNTJhbzI4ajI3TUg4ODgz?=
 =?utf-8?B?anFqOWdpRyt0dUJUd0tqa3lYTkppQjczQm1SbXhlMmxUNDdRSHorVlRxUmZN?=
 =?utf-8?B?UDhaSFE4aWdSMHpCTEdRTHBGYitYd2NWN24wOTdNV0dMZGVYYkRhYWNyZys2?=
 =?utf-8?B?dXVQd2RZVVhUZitwWFFuaVVWVHNvSk5zbzdnYUZJWWNmbXhFay9hOWtuQ0ZH?=
 =?utf-8?B?NnpLd0VQVHkxZm5QSUFaNGlvaXBCNE1INVdDdHdvWXNhMGJMOFFCNFV0cDB6?=
 =?utf-8?B?Rm1UbkYvd1pxdWM4ekhSQmgvRXN3dDhaRFNSZVVBM0laM29VUGFOL252ZmRP?=
 =?utf-8?B?b0RvLzhNWFNXVENUOHNtZ0w1aVJWMC82Q1Y3ZUgxZ0tOZUdSbHI3OXQwSDVE?=
 =?utf-8?B?Q0xmUWZLajZqSFpzSTg2ejV4NThzaHkrNXVYODd3TXVYMEJHajVacnhhdWZn?=
 =?utf-8?B?Sm5pcXBwSUJnQWk0SXFNaWlpZTdWbk5Zb05zMnRDTG1oS2RxcHhaZFVYd2tJ?=
 =?utf-8?B?cFpFRkJxL05Nc0F5RElzT0NxMWFvaHovczMrVHNwV1llNFhxRll0a3o5WXdj?=
 =?utf-8?B?VS9Mbyt3Tk1qdnU2Yk9ERk5VYUtyWXBqQlNpUU5jWFIrdzV1T0Q3bXRLR1FZ?=
 =?utf-8?B?NjhSZTRvVnBpYjFoT08wQ0toUTRMdlFqaW9PbXVoSmJuL0RBZkF3SFRpY1Ju?=
 =?utf-8?B?Qkdqd20yYmNVUXAvMDJscFdMOXlPU1VoZGM3Wkw2RUFtUzA5cE5WekVIRFJh?=
 =?utf-8?B?Z3JBU2w0ZnJleEIwOFc4RUZSZzdmbUtkbS8rdTRybG5URmtteU0wTzR6SUJB?=
 =?utf-8?B?Zm5kT3dMUitYaVdhWTNGb2VwbUlmVTI5N0lVeTNBMkUyTE0rRm1GV1lzeTUr?=
 =?utf-8?B?K2IrYmhEdjNhZWUxZFB1VmRJbDZyL0NtNEVZbEV4d1NLYzRjNXJIRzhoOGZx?=
 =?utf-8?B?dEU4aGpSYThzRjd3UmYzMEU0c00zVjVYVHRFNW44K0puMUJnN0pHa1VaeUQ4?=
 =?utf-8?B?RnM5dlJRZzFIdzI0eCtSTk1iayszU3ZDU0c3c0FwNHlLWlhlTDNnK3pFdWh3?=
 =?utf-8?B?UDNpRmNrVFhlb1ZTM1NnRGpTU3hDS25uSlkvenhWcEx0N2pCZ3BWZ1ZhLzRl?=
 =?utf-8?Q?Zc/OaR/esQpuUiQFaphoxQQiRr4AnNoPr0KKufv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578bc5c2-e824-4126-fca4-08ddeb492af1
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 00:22:44.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6626

Last updated: Sep/4/2025 @https://github.com/sophgo/linux/wiki

# CV18xx

- N/A

# SG2042:

- SPI-nor: DTS part is picked by sophgo/for-next, exepceted to be in 6.18.
- msi controller: Set irq type according to DT configuration, updated to v2.

# SG2044:

- irqchip: Regression issue is fixed [v2] and picked by irq/drivers, 
expected to be in 6.18.

Thanks,

Chen

