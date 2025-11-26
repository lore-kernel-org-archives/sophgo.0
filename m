Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011034.outbound.protection.outlook.com [52.103.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008A13595B
	for <sophgo@lists.linux.dev>; Wed, 26 Nov 2025 00:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764118396; cv=fail; b=FZEBHDkV0HMD2ScbUZKo4h0GcKAOt3VRGbzGDdosZ5/3K7FmVThjpD+PS12WNpIq5dgmw5MQXXRbQSUJSXPCVGdszfhHmePiikpVNOiyggGQk+6YvFp+1Z78jNi+1G+mNZLHECTpMwAVJEHloZpDgNT0xgJNrVqDM7c2KtgkSec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764118396; c=relaxed/simple;
	bh=uhy8Qlx4JG6Dp1NujWZw/EJcv8bBAroEdl6hg3Dlrfk=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=IxoRUh0hDrPVqinUFbdZJ6Hr2gR699oXUF6Cv7Zsg2/dJL20G478j85fLN6vVMvzw0AHVmCppYutXTepASoUuNo0HtMgV7XYpT0KHun4R05e6LvIprsVkbVZzV1PBmVLhWAH4na5LUhbUd1KeVt2q8AlME/KlNpTaxeWshgG34Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=q8gKUHhp; arc=fail smtp.client-ip=52.103.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="q8gKUHhp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDd1DYCjs6fgX8Dst9BbIxfxBBO/mi/iP6sCD1Q75HPn3+hhLzpFkdlXUwyqa2LFTzyUkx+3IGHcEvEQf4IJttHBN2FvWO316vNl/lHHDpnrarh0umfuQKB/RVWp4y+FPdQIjJE2Vza+A5gmZ2pcVrHiv9/CoKoBDZhsRCU+evrAyuO7SRVHQtzHiov67l9HKX3v8jQ3y5+hvS4i4DmwXU3m+2AD3KhXkdi2ZyKFJLOGtepItMipA5FcLAC8MzuALUYQef+hHXFl5uskNG/rGrBMr847TACubaeB/lSsdBReurUwXWjYO6sIyj3pTIRWHyMoiNdgNzeArdPVb6QQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9hty9WTrxAceJwOP+zctC9kHu08pDFiItEDrLiZ2gw=;
 b=TBAMAZ1TYyMpD0auUYxeyG6eiEd7+1rD81Wgnp7isfATjEPlGtvkciFHZKgUAJyzccf+pwzGvQV+OxElXwYm1uqKOqV8255ui9NU5wQklckHvM5GjHOtay4ETymPtK3ZuTrZH/e157gck0xHbnmbizYDpI4kef4BQqxJoB9t6yub4cCDuhhvJKP28lnMPODojTNTDbpP4RDfo10b+HjlHjSYb/KTnGFosLzifJeG9M/XNbig3IFvQFT2vfieKnlm5NqPvGYLXDXHOOdZCv32wxEHhydNVdoQnvFNkvWJz965nwcA7vTAd12KnYu/zFPX2fkZbpmK6okf/WL0t4oxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9hty9WTrxAceJwOP+zctC9kHu08pDFiItEDrLiZ2gw=;
 b=q8gKUHhpGfU9/YUWz3DH6Z9A19J6nY4XFoXi7fQmDbkvat+YtvKBCZlDKKpYnsIYEvcSZqsay36EjTCBjcB1nYfXdYM799eLNCo1F/3OhGewUpPfpWnkW318O2JMAg25J0eAcDdbgAXttzIKkXI5KVL9LrXlZJkL+9v6PL3h9aQyjwbt9joLSTgOn7FkP38gmIFPmTdbEqXGH6mLeCFrIg+5RzWJRmCZp73A/WirlzOjO4kGyPhAcQFlux7dO/UOFj97cWWCl8ahvjEBzFyMt04D0GwCxyF0u/HNHWTBYRS0VNsfkjgEnX5uaG+lSnxzkfZ8guu2V0i8Wibh5y8tHQ==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by PN0PR01MB9644.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 00:53:10 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 00:53:09 +0000
Message-ID:
 <PN6PR01MB11717596FF38E022D5A8A04BFFEDEA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 26 Nov 2025 08:53:05 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Nov/26/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID:
 <13333c74-fbd1-45c6-b3e9-d86d8ac4c9d3@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|PN0PR01MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a5a377-a1a1-4ea2-8c62-08de2c8629cf
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22402599018|6090799003|5072599009|8022599003|461199028|15080799012|23021999003|8060799015|19110799012|3412199025|4302099013|440099028|10035399007|13041999003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnNnampTcHRTZ0NHZHlsbmt2dkFNOE5od2E2d2F5VTJ5Y1FuRHVaM2JDRDkw?=
 =?utf-8?B?SHJ3Q1ZhNHh2YUM5MjQ1NDJBR0RneS9MbnZqTHZWNnRLNVR4TE5pWHNPZlQr?=
 =?utf-8?B?d1FyK2phamZTTzMydTFaYzl2elFidllMejQ1UFJ6UnFZUUJTS200dmswY2Rt?=
 =?utf-8?B?eTBaYU1LZldDNXZSY2t3aEx0anRLb2NnMVpVYXBDOEZzYjllSXBLbGRpYk9n?=
 =?utf-8?B?c1RMaElENHp6OXFmUzJldGQyZXRTaHpKSEVOdzRYWjdZajI5WCttL0IxaERO?=
 =?utf-8?B?ckE3TEZWNVpuZ2RTSUI5VlBtZFBkczVQNzZjNmRDZWswYzZPZVZLUDV0OG9O?=
 =?utf-8?B?aVJpYUcvbnlrVVFLOElPR2NiYStFZ1dKYTREUjBOQitzR2pKa1h2Z3lySHU1?=
 =?utf-8?B?dlI2RDFvNEllODdvSHVOY3JrdlpBZTF0MTFYdE1OTDR6WDhhYXd5Z3E3MEZM?=
 =?utf-8?B?RXkydm9CS2R4TTNYOW50QU5UMWZKaDBBN05BOXFnbG1NOFo4UDUvUmNpeFda?=
 =?utf-8?B?bkZScitTOWxrT1BVQ1JienBJMEhaV1FBQ3hTVXU4b3hiZG5wTTgzVitjeUJo?=
 =?utf-8?B?VXVXeW1laTBEZTB2SUhhUlcyVkJ0VTJtT2FQS29vU201VUpkRGZuSU9WUG9n?=
 =?utf-8?B?UlhDNzFmWkx6bWZHMWRLUkVzcThWOE5ST1NOZHdFSkJIWjhhNjNvVHFrSFc4?=
 =?utf-8?B?N1c0bDV0NWZpa3dhVnlCNWVxY3pFVFIxMThlcklEbk54M09RaEIyV0NsRTZz?=
 =?utf-8?B?a09mU25yU2Mvck9KN3JCaXZLRkFXcU8vcXExc3Y4QTJqZVlwOW1hMEhwbFB1?=
 =?utf-8?B?QmxwcWpGdXVpTWp2c0sxOEMwdlppVllSTUVZSWVuNTUvSlhjM3B2elRxT0Rk?=
 =?utf-8?B?SGo0ZWJDS1kxTW91ZlBUTk5jNWZyTGVOT2JmbVFEOUVsY0RiKzV5QkFwU3ds?=
 =?utf-8?B?eVJjdGc0Nkh1UmhLVVpidG9DWk1tY1BJcTd5ZlhLU29VVW5LT2UvaGpVSXRC?=
 =?utf-8?B?SWs3dkdnN0FFZUJ6c0FUYnpZckRsYW9oeFhFSW5XdERGZ0FVWm80SDF6U29J?=
 =?utf-8?B?N1dpU1ZRU2RhaW1NKzFmYW44MnMzdTFHZ1NIS29OVlBOcVhQK1YyNDJZWHlK?=
 =?utf-8?B?czg4Y0lqQUNLTlhNbjVRQnNMWW1BakVERUFyYjFHdmZPc3hBb3BEd2x4QXRG?=
 =?utf-8?B?S0N3MzdGcUVyL2ZiQ0Y0MTdUeTQwQy82bkFmdktJTGR1VmlGTFdiMTliUnlY?=
 =?utf-8?B?MlJuVDNkQVdtK2dOVE4vWjZ5REE4ckhpbDBNSHJmZDFDOXI0YUk4UG1YbG42?=
 =?utf-8?B?cFF3WGRIV0g1WmVQYTNDWklvNlJmVEFSYXU1SmVGWC94YW9kcUFoMEdsUFMx?=
 =?utf-8?B?WlZTM0MyTnE3UVA4OEZ5bWdyWmw5WFQwUDRqTktUUmd2alZlTVVWTXNSUWZa?=
 =?utf-8?B?Y0diakw4V0ZMRzhZNTFZeUFkWnVEZVRhOWZ5Vk02bk9FTHQ4dmt0bmJsdXB4?=
 =?utf-8?B?d0FxMW1LRkVqRjhjd2VQblh3RE1CY0FOVnNOOFlJWHg4eEpxUGZqTnNFL3JW?=
 =?utf-8?B?YnZBdk1ybVNHUi83aFJjdW0yTUJYWWlnZlRXRFpUK3RVVW9xRjhEV3ZVeXVP?=
 =?utf-8?B?VE1hWUxGZEdXS3M4bGg2ckh6aXVvLzNvWXNwVEZIVDArYXhpd0pHUmYrTkpv?=
 =?utf-8?B?MEV0NXI1L21CRzdycWxsT1o2Mjg5SWxpYUJBM24wQkRCNTBoSWI1SmJnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVJJS1RrVnR6eVZTY0M4QU9VcnhIZ2VkaFFKQ0NZdGtmNjAxcm9URDZpQ2dB?=
 =?utf-8?B?UVoxL1FrYk9nbmpuT1pmbUVDQzg3d3dsTUYyUEpmLzZ4TytkSmtBL0gxNXRD?=
 =?utf-8?B?VEJXYlF5MmN5NjhoU2pmeHZ0cElZa1FtMzdtcG14TVIxU091ZlVxWmZOalY3?=
 =?utf-8?B?LzlZZ3JsazZEZXZrb2NEK0h2U1RyMm5MU3NCdm0xVEU4Yk5VVFlnSGhpWHVl?=
 =?utf-8?B?Sk1nWjNJRTM5NiswaDRZSklmKy9zSDJuKzk0WXdUWTdBdkc3V0VRZFdjTGcy?=
 =?utf-8?B?OW9ZY2lUWWVNaklmSVg5NGxCSHNLa3VMTS9PRlNsNWcvWHc3MUt2dmVkS3d1?=
 =?utf-8?B?N0JXem5RUEN4OGpsVkdLZzJoYVFsd3NDQkJqdFBiaGZYUTd3ODRYc2wycmNv?=
 =?utf-8?B?T08xQ3JBTEwxbjBIM2liNlQ5MFhCWWJOcnhPd09NR0U0aklWSDZRcjJMUW0y?=
 =?utf-8?B?WklmKy9Pc3V2QUJhclF0MEpOOWFpOXZEY0hoOHp2NUNsbkM2TEw5L3VzelpE?=
 =?utf-8?B?MTZaK2lyY3BMZVlGWWhRRjZsSmR1ckhEM0ZTWktvQ2J5bFE4ZW15SVhFd01B?=
 =?utf-8?B?cDVjVFd1amFvalBCYW1HcEJnbEwyK1NrejdGclRUclU1UW93NWNJMWJCRTNF?=
 =?utf-8?B?ZzJoZW40UlJXeFZmVzhsWkg1UW92WmdwazRXWEZ2NE9ZaFVhS2dYMDgrcTc1?=
 =?utf-8?B?WW1jUlZPaTlWMlpqMGJTWnZxUURhWHJwZXdRQlVXaGk0MklpblJwVG9QeTcz?=
 =?utf-8?B?dnRXZW9Ld2xYcEZBQklJZEgrMTd5VDAwYW4rK0JneGpzaHJZbGUwblpKUXVZ?=
 =?utf-8?B?VURpQ0hOWkpsWHJnWStmakhSaU1zdkROd2JVT1VpZTRpSkpFYzdUUU9pd3FT?=
 =?utf-8?B?L1hJb1dJZlZXRmFUZHhnY3hKYWowV3l2cDFDNFM2RGJuVUdmK2g0NXU1ZVRa?=
 =?utf-8?B?ZVRSazRrWEVRaFNFMDducGJ4TnUwQUwrclJhQzk5blF5OWdZcWlqM21Vblgx?=
 =?utf-8?B?RFFpSXovdmRDSnZ1MlhQTjhxVkd0VW45MC82dlFqY0R2cWxkRGFMUk1Tcy9W?=
 =?utf-8?B?RytET1pxTEFPeHhPM2F3dy9DeWpQdHBEdzBTbk5kU084enh0S1pLUTgzdWRa?=
 =?utf-8?B?V0UreU50VFRIejViZGM1amNXbWtnQk5QSFJHZUJoYlMvV0tEQ1RFaU84RktL?=
 =?utf-8?B?UDVibmVDSmUxWFZVMDZ5WlRZNFg5UkRuZSt5SHdSSGpHd1FhazJ1YTNESUVs?=
 =?utf-8?B?bmFCTEI4bzNJRkMrYy9HRjZwS3RsdmlyRHI3VDJaYVV4VCtsaHpEd1J0R29j?=
 =?utf-8?B?VDVNaUVFTkVFYU1sL2lyOTB1SDBPc0VVUlY1YlQzVXpERFczSUw2SkQ1OXJ2?=
 =?utf-8?B?V0xQVnBHMUthekgxamtybTZYM0JXbGFLajFVUEFoUEJuWjhYNWdhNmhsSDFq?=
 =?utf-8?B?Q252VmFqd0xIcjNBd1J4T3UyM0JKazgzUldLdnAzRWQ4ZEc5cUJBamlQSDcw?=
 =?utf-8?B?czJwZTdmMG5jczNmUHlzVHQ4Sm1VMUZNSE9lQkdFTHZYa1BIVk1zL1NOc2RD?=
 =?utf-8?B?U05OY2lKcHNqd2owTkthdHF5N0xmbGpHbmVIclNDYWpWcVloVmZFZGpZZm1G?=
 =?utf-8?B?QitIdk91b3hjYWVGRllIdmpwS3pjUEp6bHY0V3QxaXd3dVRIbW8xbUw0dUd4?=
 =?utf-8?B?dnlaVk1aZzRRc1JEMWJ0NlR5TE9ibjVrRm8xV2Fzc1l3ZG1vQ3NvZE9VM2tv?=
 =?utf-8?Q?kf9W4S93o10kCzAbtPRKHmLL5YUFAv6Zg9DZAPJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a5a377-a1a1-4ea2-8c62-08de2c8629cf
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 00:53:09.1747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9644

Last updated: Nov/26/2025 @https://github.com/sophgo/linux/wiki

CV18XX
- Top syscon: v5 is picked by sophgo/for-next, will be pulled in v6.19

SG2042
- SPI-norflash DTS part: v2 is picked by sophgo/dt/riscv, expected to be 
pulled in v6.19.
- net: stmmac: dwmac-sophgo: Add phy interface filter: updated to v8, 
and applied to netdev/net-next.git, expected to be pulled in v6.19.

SG2044
- Fix incorrect use of bus width value macros: v1 and picked by 
spi/for-next, expected to be pulled in v6.19.

Thanks,

Chen

