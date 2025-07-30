Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010011.outbound.protection.outlook.com [52.103.68.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F822D781
	for <sophgo@lists.linux.dev>; Wed, 30 Jul 2025 23:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753916537; cv=fail; b=rpgB78KITGDzCLmj+mrCwMAq2tmC+Ps/ZTxnWTaXc4pkthmqGr9zD8QGMOh2bd7KnEt2auPeuuyZiMGIjQu8LZfUl5AfcHERbfQB+Ftt17n5QlvrvVj1MrSKYtFsojqaJswZdWjd53fyENP1Nm+m58Q6a6qGGSXjCBdpvDYri+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753916537; c=relaxed/simple;
	bh=e+dQRWcwcGBBT878SichNbRNlQC/hTtxrbGz1tbCXGc=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=TxX0qRZQM06FUNvGASa06F/T+LBwYEM3QyG49qCfvupJGVkaLyFJQ1jABkc8FFDM5E30QTcYsAHPiDICZpHzGVm752poI52ZSyy04W807HXijsFxBiqzuQT6sxL1SM6/XKtdjmPPQs2OgzvtZ7wZQkNkA1u4Hci/WsvCvIB4sNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Zkq8Oj/6; arc=fail smtp.client-ip=52.103.68.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Zkq8Oj/6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1FM8u+GQS4bhz+T2bCMMU7GiililCP7rTiwnWCepFrlg9Ya+LT7pKc987iVPLewrodLmb3/0rKCol2eUCMGsxE1IoG23NaqxiHmbsH2mMkPN6ypxwWEPhXx2wBnUiA696wmLXWSE5SSDNwrVbEthjhKSJ0eQDx9L8isDZZOSEmKLItu6jUvmlhd8jctOQrMcsrfDgugxYj/XAm9AU373F0tKodWjvD/ddqQ74pZu3y4RCA9qSaW4zmTMg5vVWEjpwbqTvIw9kNtDfnNM2HBiOtmLin84SqIRZluMzYYzD1Olv2zQpC5i2uhWmPyODwd9k4DU3NbV3ntI1HuBpgBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJuJhfygN5zxScXS+jWMXqBXACdkoRqHqCaFcl8lhJg=;
 b=Gyncfkl4wzi2pwDfJvGNJTvTh8HMrvYaZ2iGY5E33vNOXQDNezPpU5vwtYc/ILHe1xcBM/lAs9OA/LsPHCZAv7ho5ud3o6M40O65FdI9UzWxssYHpDUspJHV5tKayPdKa5rPZrzKQDwMj+JWw8HBVx3bfoVCefHPjji/l9Er0EthPimzgs7OD9a+dRzKeJ69ULGn3C5ifUBD097GgS9x4LKM+P0CLp2DU495ybUMd0iyDdJOWd3puqP0PPDTAHs6U4WBz1QG8uK5MZvUxbO5i48kW7xUwpX2N9Bux0w3P2UeWO83ijMXv7GLnO2DQbydodkbRVIymM+J8ljF9RGmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJuJhfygN5zxScXS+jWMXqBXACdkoRqHqCaFcl8lhJg=;
 b=Zkq8Oj/64DLulHK4/2dWbIvdTbOresoHqdwnj+oNMl2c+GhOhucV9dvMUnidYFVkNcGxpfKlv7FDkTaKaVMAL5lLuUN34dnnrV0VxENR0cpEYtALHNP71TOLHaLMVOBR0UbKflhrBvoPEbosizCPho31vxsXDQsWyTbGCD42PbZoVlhR4TzEERpIVsCJ5rb1KJyyJDwFhp2a1G0x/PSTv7lpqGzkKWAm0+5xH82KIJ5esCcVUWb2AQb60OoVsmM3B3DjzhcLbASQSVKLu1c1iXTWMuTe9eY4+bGMat4cybmotiYEdFVWQsgxki+HTkWqBTXA6OFNWIbeu67epqRbfg==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN3PPFA20F8D381.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::49f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 23:02:09 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 23:02:09 +0000
Message-ID:
 <MAUPR01MB110722348CC38E479EE16BA18FE24A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 31 Jul 2025 07:02:06 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jul/31/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <d0c438b2-05f9-48ed-a12d-5e29fd4d9692@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN3PPFA20F8D381:EE_
X-MS-Office365-Filtering-Correlation-Id: d535f9c9-795b-429a-4a82-08ddcfbd1c4c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|19110799012|8060799015|461199028|22402599018|6090799003|5072599009|1602099012|4302099013|40105399003|440099028|3412199025|13041999003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2tybmxxWEpXa2JxQWZUZHRMRGtmNno4b2J6VEJqRzZQY0JQNytjaG5UUGZv?=
 =?utf-8?B?M2xWdlRMbWJpU0FrQ1crMGV1ZXAzeUo1NEUzUEh6R1Jvd2tobTF3MlVjTGVk?=
 =?utf-8?B?UzZpZ1kwcTUxV0dDdkhuVm43UU42dU82WmdnS3lBNlNZU25ZYmRaMHBhY29j?=
 =?utf-8?B?ZkZVOU83d0U3L2NxREcvaHdVY3dEYVBxZUpWNi9zRVdyMXRlQm41bzRBTEg0?=
 =?utf-8?B?UklobWRsQ0RzclNUNWQxb1VIYmFkY3lQR2p2REtDZFJIK212TWE1THcrR21Y?=
 =?utf-8?B?NTR1WU5vMnp6MkJNd0JCemNiTFEzWjBXUWZKTko3eHFlTU1ndmZQYTVNSkhI?=
 =?utf-8?B?ZWdUMkswQ1A2NUlZeWNURmxlUDNuamxqWCtOMGZvLzQ1WWJNZE80Snd1dnIz?=
 =?utf-8?B?UzlERWJld0xBTlY2RzluWGNCTUR2OFBRR1UzQzV5c1pPU0ZMYUk4aE9TeUJl?=
 =?utf-8?B?WElWeVdVb2lCVFhZTHBGdTFxVUNCK2dMTkJ3NysvazV6cTFQalp3QlpUWVpU?=
 =?utf-8?B?aUxXMFhOWjFrd3F5c0hCWHRkQTF4bDBheWRKOERMcDRJS3VheFYvQzVJZTI0?=
 =?utf-8?B?Z2RyK1ozVjR6eE5pMVBwTnVnbjJ0MkkwM1QzNzdTTWRtRFpOemFRMlVFRVNZ?=
 =?utf-8?B?alhqcXI3NHEzUlFwemNxcUgxMTNNRE42NWx3MnhYK01OdUFoUnB5YmNYd1pY?=
 =?utf-8?B?VVZ4bDduU2dtMjhHdlF4NEt3dU5KcFUwK3BmbHYxRDNFdHZKVEV5NUJDdFI5?=
 =?utf-8?B?MllwVjVUaDZqdHl3WVQxbHVkdGRuK0Y0ZWQ2NW8vU1plR0Jmc2JmNjlEcGxw?=
 =?utf-8?B?NTFJTDR1RjlBWnVIRGRlQlBPbThDYnE4eVhaanppNUxTZjVZVWJMbCtSVHpr?=
 =?utf-8?B?aWY3aS9jM2h5RmsvRkRFMENjSENnc0pDdFltU2U0RnBsR1dSUUdYV21xOVVD?=
 =?utf-8?B?MkVIMURKbWRVem5ZSjBJVFFvbE9BRHVBY1c0SjNRU05zTG9hOGN6d245Nm93?=
 =?utf-8?B?M1R6WmxSTkZDQm9tSytBT1YyTG1QWlpYN1hPdjgxVUpjU1dtMnhTWDlvNThE?=
 =?utf-8?B?QXc0alNEQkZyWitCc1J5QTdEeU9JbnJPVEhVN3YrMytnNFN6Z3FIN1o2NXVz?=
 =?utf-8?B?Vi9HTnlYN1VRMHhpb1BxV0wveG93S1gvbkl6cEZBdVNnQnpuZlludU5VV2tj?=
 =?utf-8?B?ZWZvOStPUGJyRVJDdTgxVy9ZdUt5bEZFZ3pvVktwakZaeWZZRTdLenp6R0s2?=
 =?utf-8?B?T2Nuc1dUZU81WXVhcTZ3c2hFVE5YRlFPaGVvYUxBRStpY3dPNHVFV0FPb0lF?=
 =?utf-8?B?b1hvdnNOcEh2RmVuVEdHWUI4SWd1SHVIZHBWa3djZkRhck5xdlkrRGtodVl0?=
 =?utf-8?B?dUMxS3JmQ0VBWEQ1eGhpRmt6anN0NUc1a3hUdzZ5N0E1QlNaa2wwY2JvN2pY?=
 =?utf-8?B?VmJ5Y0xFZU1QVjhYNEFnYUZUeWtBa1VBVkVCT2NYT0ZqK3JOQTNENnAxQmdu?=
 =?utf-8?B?R0VvbVdES2NGR01GSXZ6Zzd5K285VWRPcEVoNzRKbUJsS05HdGdFRkdpNi8x?=
 =?utf-8?B?ZHVrWVNOZi95N1VudG1xYnFvN2ZMWG04MmVpMVBDMWNndDBJTnN0clM1VjRi?=
 =?utf-8?B?R1FCTGJ0UnRSZlJIdUxvNXVHckN5a3Y0UE1FWTVtbGtZeFVESUZkYnpyNnlK?=
 =?utf-8?Q?4579DOn+z8l82UVEoxKX?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTdHWkxRemFlT1dlYXpiZFRzQ0h4b2Zqc3FsOVd2clNRaTMyRmpHdnRhVlpi?=
 =?utf-8?B?TU45ZDhuaEVNMGN3bVAwTjVnN0xnMW1sckF5K1BaRGFVSWlnc3JQTWgwSkVi?=
 =?utf-8?B?SU85dEFFUGFDSGlMaTU4aHB1YXpzS3VJOHZlMTNMZ1Uybit5aDBxaGpDMHNj?=
 =?utf-8?B?Z1JPazlqUkJqZWlua3RNVWJic2o1b3lvU0JTNDVlck5lQTZ0cThOaUUzamRU?=
 =?utf-8?B?RjVQZTJTRUNNQ3BOWk5yM1pYY3dUSExmeC8yNzhxVXA5OVdYUGdzRDEwaDAv?=
 =?utf-8?B?WHdoc3lvTEsySlFvMnZrRmwvby9uU2ZCQmJYL0VZUk5uc0xDbVZiZXNnY0Iw?=
 =?utf-8?B?aFF2cjRIVHkvQkxNMFduWVRSeGZKb21RNmk2NmNZRDNrY3lLTWo5QkxTWUpz?=
 =?utf-8?B?ejJqbjdIY0hSMDIwOTJUK3R6c0dqUXN3VXlDaysxSElkU3R2WldFcHpmbWw1?=
 =?utf-8?B?NW9HeTloWmFxbURVL3dlZmlPemFmRHRIek5rZnJQK0ZRdXAzTkh4bml6bnl3?=
 =?utf-8?B?Z3p4emtGM0pxTXVuVjd5ekxPejFaMFhFclNhcWptNi95U1NRWlBKUjJKa3RX?=
 =?utf-8?B?dG1XQ01DSVM0ZXduQkhVazlyKzRNYTNJQUVmdmFIYjNYZWNmNWNqRDB0U2Yy?=
 =?utf-8?B?ckhPMkZ5TCs3MWwxMGpNZ2xtc1dWbUMwSFpUOWtvb2syYzRkTjdlV3ZaOUgx?=
 =?utf-8?B?c0JIQVB4RWFvdVI0SUwzS1czMTZNSnpMaEtmblcwTnJFNEVLZWwyWUR6WmZa?=
 =?utf-8?B?bjNFeHR3ZGQ1RUdzRDNrWEpVYVpUN3RneTNyc2dyN3k2Nm80a1JDQWIzR3FE?=
 =?utf-8?B?azV1bVc4QlNLQVR1c1pTeW5KdXNLeS9WL2ErbHpTdkdBMUtVRVpTK29vU0FP?=
 =?utf-8?B?dHhJQVpRZS9XMFFwUnJibTFQZkFWQUxoZktoTTJxRXYzdW5DcEQycHIwVnhx?=
 =?utf-8?B?LzFHemVpdVFFWi9TN1E1TzZGWmFyNE1SVXI4Y2ZEUEt0Nm9yTnp1MXZOamxS?=
 =?utf-8?B?R3B4NUttSkF6cTNoUXgvMWFBdVAvSEhYTmhudUhTc3Q0aFNQeFhveWdEU096?=
 =?utf-8?B?Sm1DQWdiZ0ZCa0hHOGVudHlFeHhWTmpwRlR4V0hZM3Vqc08yM3lOMWtlY2xP?=
 =?utf-8?B?VGx2a3dTUlZEeU93eVlJdnpPWUJxMmNQcWNmYXJaQ0pxaTBhYWM0VFhpTVpx?=
 =?utf-8?B?SDNOeXFWNFo2d1BqNkJIVHBmMitocUFKcDQ2ekVRWDlrVjFjRDllcVEvOHBy?=
 =?utf-8?B?UUZENnRtakhzc3l3L0RSTzd6WjFtbXFETkYyUlU4OTZaeFVYMkpodllKazNU?=
 =?utf-8?B?RFF0SzQwYnRLRVJVTDRJVVdmTDgyU3Z3dHJpYk85ZlZQYkk0NG5ob05ib1Zk?=
 =?utf-8?B?M2F5a085NEcwR2gydGhxRmgxWndYWjVyTWhHRWRpdC9XSGtTbGo0V2RiaWhr?=
 =?utf-8?B?QUVkdVorT2VrZ1V5azVGNW51eTBVakNNYzRDUm9JaWkyRm95OEIwMnZyUlNx?=
 =?utf-8?B?bUtOKzE1TjMrLzg2c0hBQzEwVW5UdUtXOUZIOElQcFZJakRTbjFuUlB1UTBY?=
 =?utf-8?B?Tys5LzFRRVVTSFlCUnlISlNRK0NLMmFFT1F6bGlnY1N0eFBuRnNHTWt2RHJ1?=
 =?utf-8?B?emV3SkluZDZpMFFxL3l3NThqQWtPamErbmlGb0JKVWh0b2E3dkduQ3dFbHVB?=
 =?utf-8?B?NlVTSWFrRkptVFZVdlNLNWNzOEw2MG15Z2JGQ3VqOG1CaGZTRUl5Y25UVWY4?=
 =?utf-8?Q?7YdQGuQa7Zh0xJeYJweCycaLzLNDxtOhlyG+oPc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d535f9c9-795b-429a-4a82-08ddcfbd1c4c
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 23:02:09.2350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPFA20F8D381

Last updated: Jul/31/2025 @https://github.com/sophgo/linux/wiki

# CV18xx:

- Remoteproc, updated to v2.

#SG2042:

- SPI-norflash, binding/drivers changes are applied on spi/for-next, 
excepted to be picked by 6.17. DTS will be picked in next cycle.

Thanks,

Chen


