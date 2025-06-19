Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011036.outbound.protection.outlook.com [52.103.67.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED1720E33F
	for <sophgo@lists.linux.dev>; Thu, 19 Jun 2025 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320714; cv=fail; b=IijntZ0ivYOvtIOdSLOgQNoK1nnRsHd6BEFTtztBqd5O4v8Y+4cnllnaUMKae3HquGq2N5uKJktK7JFS3+FFGyLBUEBkfBieHZ9jwim4rAM4kBxK3fukHlcAUiKJxc/0K1m0Bi+d1Xino8WQ9FmM+j4Q/mlZ1OJdboKjpSzgqKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320714; c=relaxed/simple;
	bh=kpXNqkupribJH2KfKjHhEBoBIQ6HJ+JYc/YVjdkDcqI=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=POU1TpOqCKp3zVBh0KptCrbz9gNXtpUJOiMm71ydt7e4bRVxUaxioDKHKlB2GGfblyFwCRNK7MzqJXS8YJceMw1aLBr5boe7L5DwxJPbMOCTAAgFiXDB6zI2dNDCeaVP1ZDO/aqKMRFdTHcAZovNxNiji4SVFVObGW5UPHMau6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GBSNO/It; arc=fail smtp.client-ip=52.103.67.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GBSNO/It"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlnBHwQ9+N1RnxamDlbZ+S34qsTWEx6HEGFQwPxaVgAcsUUP67UaIzv4rISRyICLsQkP5MaLIwUyLOuNSwURjYYfXisYDxcxUnIrTRy/sprWJiBEjyRVBAzNW4K0LX6qRKClM+v7ZDMmvlFdr156lPOjreDJQFQPE2vNdotM/VSt4pfy6VzSt0JDiZpHRUl3vJ5avwE9tfxlgCuMJ7DaElUDAy9Ojk9BFGv5fOEzXDTuHAyIy4Jg+sRA0LTQJO60IIvXVEROkCGypEnPIQL40HDFBCxx+3aEgLrRCWYcFxkNKN3NEz0cYk1+GPV408O+Nqfvf3X2i7xRBgETcniWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+Y0IcpB5xTSdxiSBnA/4yp6HP15VZZstBpcpJqpGx4=;
 b=Ef2Kw2SK9YFzmGKAJHELn/kL/p2J7jxsqlcH32Tss2Fykr2Ps5Fmq0MT4JNVNIPnosmEGKoggZvdEx4jmlxYdXg4E/6H5cBgljN0sZp4mGDwGYqM85q3vaJCRo3fkUbrL8xitqlQn+6Ah4hGtYFBfYLXrfyvmw1baXC8tqCv4IXnVAK8Da0GXsdKrAVvDAFsnHRrWgiTyIl8VpSx4JQ8si1eZs3AXBzMCVdUw44jMw4hD9375pgVIoP2AOHUojWU2Vy/PTV2mMAZioF/4HMrnxfmmlNG1uGva5haroG1PzvePkii0T9AbSyfC/4Yu0erq6AQeC7cnSW5xTdDiEFYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+Y0IcpB5xTSdxiSBnA/4yp6HP15VZZstBpcpJqpGx4=;
 b=GBSNO/ItoFddh+bGYZyTjv9VFog9ioJZxApamkqJjmbZqmqq/JdGcCaqopCHZ0MGU3IbGYfftRvkGLiTrSU5Lr/1hLQlVjIH9UIPGEtGVTSoAzbxxPYA2ORQPlkr/6uEkIyvchRUDHonO/dNkhY/fI1z5z9olozgEKgcIOkPPxeQbeVy4348T0zvVW65g7tmb6fWj5xdZaLufqABO7+IZ4gltVwROZSooICKRXcU2gy9yrmuPaaXd6aoGmCtUeeubOcWUQKhSWpYp1Fn9PCHejTwGQr6u6W9TDw3FtkKiOpnzYVn86fN9HEqPn5oxVVb0o5dPuaRdyLFwlL1jwh9Tw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0481.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 08:11:48 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%3]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 08:11:47 +0000
Message-ID:
 <MA0P287MB2262D60C3C3D3AEF534C0666FE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 19 Jun 2025 16:11:45 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jun/19/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0064.apcprd02.prod.outlook.com
 (2603:1096:4:54::28) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <beea442a-61ce-4642-b742-1b2f23395edd@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0481:EE_
X-MS-Office365-Filtering-Correlation-Id: ef652965-c409-4b7d-2ef9-08ddaf08efbb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599006|8060799009|22402599018|15080799009|19110799006|5072599009|6090799003|1602099012|440099028|13041999003|40105399003|3412199025|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmgyRTl6bUZSenRhUXNWNUFiUysvQllPUkkwWFdKdW5Lbi91S3BlRXk1aVpV?=
 =?utf-8?B?Wi9GU2F0UWtTSUFOMTJpcTM4RWJxekorV0d6N1dobUIwYU5jaEIxUkE4dm5P?=
 =?utf-8?B?ell2UFVIWTFmRFh2NFBDR0FNckRnVEUxVFNWRGFpa3FMMFlUWDFVc1cxRGtL?=
 =?utf-8?B?NHdtdUF4MmZEZ1RqSnhINUJxM3BHSkVaRXMrcGRHWU92UEFMYnYzbGxJQy9u?=
 =?utf-8?B?MUpnY2xCVERyaER3WmlONXdyMGxHWGhXMmlTOTQ3cDhQTTZsNVExR1VDdDhx?=
 =?utf-8?B?MEd1QVRRT0ZyWkYxMG1WZS9nVWVDd3ZpSXJocDhsTnA4NGpKbytJSFhZeVkr?=
 =?utf-8?B?SDY1aFM3bWVZdEhaT2dIcWFLMDN5cW9tVFpVcEhvd2lVZlNWUHBldzF6RzB1?=
 =?utf-8?B?NkYrN243MTlhemx0Z3AreXlrTWtwTitmQ0FaWmVpN0plRE9uK2VnbXh6VXJk?=
 =?utf-8?B?bXhsQXA4cWdWWkM2cVZkeGM5R0oralIzeTJnbEc2ZmJDaVlLakM5bGtqRDNB?=
 =?utf-8?B?M3pzSFJQb2dnZjFhMjZzclNpZ2ZTVDRNYlgzaTNuL0g4dzY1TnplS0JZZFVy?=
 =?utf-8?B?OTUzNTF3czkvUTlncUt5ZEM3aDcveXdqanpUVGlWcUFTZ2cvUVJDTFF5UWli?=
 =?utf-8?B?dGFGcStVdFV0eVN2a2VFSlFNank5TDd1RnhETldPSzBHR01PRDllcGtXQ0NE?=
 =?utf-8?B?NjZRR2pSd0hDOFdEL09pYlQ5ZWZNNmlsV1djWCtmRzFEbEY4UnFad3NZQmcy?=
 =?utf-8?B?N3BScVZBdTZoOTh1RmNlcU03c2JLYVdMMUFYekd0cEJCMTkvRy9KdzZsdFJl?=
 =?utf-8?B?N25NckVZTGwxRXp1d2g0Rm1WVTk2NXhpWFpmSTczWGNacktSZEpJK2lWeEQ3?=
 =?utf-8?B?S0VYd2g2Y3VKVitYY2dHT2ZZTDErMjE1aC9KVWhNMXVFTjB5WVZMK1VwYjZ2?=
 =?utf-8?B?ZnBCRnAxTEkvMjdxT1VpbjJNWEZPeUxoMEx2WUkrZk9GK2c4dDdXNEZWS3FD?=
 =?utf-8?B?ZFo2eEtOL25McU9uLys2cklJTWRLQjhWd0FtSmZRRGFtazJPTWFSdFc1Rlk5?=
 =?utf-8?B?MzkrMjM5b3BycG9uVFFkSEpLVDY1aEtvYjF6MGhkTUpkd09GSUNFQ0VPdWJO?=
 =?utf-8?B?emJ5OXN0aElQVmhIczlrZzVjWDJ3UEoyMVpqRlZUSnhkUlN1NkhhV1B4R3Mx?=
 =?utf-8?B?cThOQTExN1A4V2FSVTU4RzF4SmNTdXh2alRJeGUzNzUxL3N4dDNOOFgyM3Yr?=
 =?utf-8?B?Q1QwcUxSeE8xemorYnY5YzVLemZvQkRFUy94OXRjQVhKUys0aEVmVzFpMEJZ?=
 =?utf-8?B?c0Z5djR3NlliNTdMN04yL2tvek9DUlpmS21rakl4cFVRNmw0elUxQS9aZlFW?=
 =?utf-8?B?YmpoSVQ1RzFmNStKSkpFZGlHMlFvY2FROGN3enZUUlk2b0t6bXZnOEZyQ0FG?=
 =?utf-8?B?SmpEY3N1Y2JRcU5jZEl5WFV5RWhOdWZiN0NUS3l4ZUs3UTErVU1SUVpFUFo2?=
 =?utf-8?B?Nzc2aCt3bSs5VkdRMGlnazk1UWcwUG5ESnJXQnM3ejlEVk5ycEpoWkRWbklG?=
 =?utf-8?B?cnMyZlZKZkwySDBJMEcrMURPdUNFMnc0L2FteUh6WTd3NkVWUFNBY3JRSlEv?=
 =?utf-8?B?NE85aytvTkR1YWtGTDR2amhqdU9CLzNuKzdhNTdpN2g5US9EWitqZEJDZTYw?=
 =?utf-8?B?ZE91c0ZsQ3VGdHI3a2FBWDFTbXdjeDUvSGp0TlB4bHlJZ21WMlV1YzZ2YUJj?=
 =?utf-8?B?SkErZGdDdlVFWm1TUnFQdGFTQmhYek1UREt2akxLMkFhdFd6d0VCVS82bFA0?=
 =?utf-8?B?YXAyM2xWRkZISTF2Y2duRk1WcUhHUEZJTXByTzRpNkNHU3hVbzBtK1Znd1lN?=
 =?utf-8?Q?HPEoPXKZV4Ttd?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0t2eFJoenNLOXNKRnpIdG1qZy9IazJjWWplc0IxRHdjY0xvOUlmQnc3WGN5?=
 =?utf-8?B?aFhBOGwzOElwdEppSTBYblVONXhvWUJVWUdHTTdsdndObUJxcit2RFZEZFhk?=
 =?utf-8?B?OExUTmhWUkVmMGtuMmEzSnBEUHRzc1p5NHA0YXRUQjQ2WnpJQzNRdUVic0RY?=
 =?utf-8?B?U09HOVcwa0lidytaUVFOTURzem1CMEZSLzR3TlJoZ1JMYlBDc1lBWkkxRnRw?=
 =?utf-8?B?R2dkK3Zsck5oVmlzU2I5Ynh2bTB4VEtrZDlFd1VXMmJjRHlSUEFaMGVuNU5o?=
 =?utf-8?B?WWtQTkk3QkhxS0dvZEU3LzI2UnFuRWVHL3dLK3RzNmE5RC8yc1FFcGNaMnBO?=
 =?utf-8?B?dUhGOVlIUXlZellVK3I2ZXJJSVd5UGxsdFZBMTFwdENzVVpxekxYd3JMcnRt?=
 =?utf-8?B?U0Q0Wi9jeXZYalc1YXVEN2NkTzdQUzBqbHJCWkJnb0g4NVk5ZWNFTmlzZkpZ?=
 =?utf-8?B?bzAwalRtOTVYZUYyWkl0SVJEUGcydGFQQ3psOFF0OGxTSmI4ZzZxR1NzUEh2?=
 =?utf-8?B?Q2VpVFE0VWFWQlQ0aXBNY0Y4MWdxUWpRTmg0NlhYaC9OeUtuV3VhbnFNcXJa?=
 =?utf-8?B?ak5sZ1Z1UmpnNnhWbVNGOHIrUndLVUwzZHFVZ0hiVUlkUEVmR2k3czkyTmRh?=
 =?utf-8?B?cXhRc2FMSGNpKzZtRzd0MklJT1JiUCtxZmwwT2d3QTdCdytNaVdnRURVWHFo?=
 =?utf-8?B?cG9YWDlLQU90SXZQdE5QR3ZtbmpwK0tsWHhsNS8vMWgxQWpRNWg0RjAyY1RS?=
 =?utf-8?B?VkZFM3NXNEEzVUE1UFlUUk1xR2RYd2xvYTJ2TkRqVXo1VXBWRTI1ZklsdTFh?=
 =?utf-8?B?dWtqTHpEblF6ZDVRMEJiOFYyRldybDQ0QlVKdGVBODEvdEd4NzVLL1JtOHhE?=
 =?utf-8?B?Z0J0N21wajJnTFQrcFVlckhQN1EvRXNocHJUTHhPbHZnZ0MwTk54am1iZWJI?=
 =?utf-8?B?STA1Z2M5dG5DTmZ0MUwybTZDWVUrVlNFRE1rUExhTitXazgza2Z5YWh4OHBF?=
 =?utf-8?B?UElOOS8wUXRENlN2Z2xHc0xEbGliKzZzMkg3OUd5NG1kdU11YUwwMDlpRFpI?=
 =?utf-8?B?Y1B2aDNRRDRoQ3ZGditweGc5OWNPdXNPcDdBdnJpc3Roem1XV3hwTVFUcFZF?=
 =?utf-8?B?UjV2STR1eVNpc1oyakkxNVJNeFJqRXZtNVZRME9iZjViaTY0N3ZYVU0rNFdl?=
 =?utf-8?B?WllWVDVNajg4MU0vVGRVZ2QzeWczTStPOEtsVjFkNkF1V3ZmSUJuK1hCbi9n?=
 =?utf-8?B?elplMFhKbE1tRFNmamtmVnhnZW1xMXNjNk5XUVlWZkIraXZXWnBoanIySjhh?=
 =?utf-8?B?bVZXN3dwYU93YTlOUlNRb1JqT0MyUHVGZzJOU0w0V1JOWXdPYVV1Uzd2UmJQ?=
 =?utf-8?B?b0FJbVBtYVJLOWJoL1JrQmFuM25ISkFlcVpCTnNwVFp5bVlpdGtHTmNFY0tG?=
 =?utf-8?B?WVJnWXdmcU5nQUpGeldKSU9OTnVUN2I0ekxFTW11eDk4WXhRM0FoZWxkRDFM?=
 =?utf-8?B?Tnh5SEdxOWhlMlBybUF6dWwzUW5GdXJLVHN0TDFCMUF1NVk0cEdOeVRmV1Q4?=
 =?utf-8?B?SzlZUHNpcGx1YVV6SUVyRWJteHhBbENtc0h1Q0c4b3ljUkU5eUQvSU91SE1j?=
 =?utf-8?B?Y0NWUUJZeHpDc2c5N1FqYVBnVFpUNXkrL1RKWHJrWFJOMGZSVnhrK3djbVlY?=
 =?utf-8?B?VDMvM21La1lPZnp0bnNnQlRKTG1paHFyUUFaaXBiR0pUd3RTZ09TakNRaFV2?=
 =?utf-8?Q?2kEJfigdzT93XMVyMXHoPSBzmahEcb5LUHQlVr0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef652965-c409-4b7d-2ef9-08ddaf08efbb
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:11:47.5873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0481

Hi,

Last updated: Jun/19/2025 @https://github.com/sophgo/linux/wiki

Quick Summary:

- CV18XX: Reset driver updated to v4.
- CV18XX: DMA-MUX is applied to dmaengine/next, will be pulled in 6.17.
- CV18XX: Duo Module 01 EVB board support is updated to v8.
- CV18XX: A new patch to rename compatible string of the USB device for 
cv18xx, v1.
- SG2044: DTS part for PCIe v1
- SG2044: PCIe driver is applied to for-next, will be pulled in 6.17.
- SG2044: PWM driver is applied to for-next, will be pulled in 6.17.
- SG2044: More DTS nodes for devices are applied to sophgo/for-next, 
will be pulled in 6.17.

Thanks,

Chen

