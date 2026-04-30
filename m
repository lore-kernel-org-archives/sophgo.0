Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011027.outbound.protection.outlook.com [52.103.68.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCCA35295E
	for <sophgo@lists.linux.dev>; Thu, 30 Apr 2026 05:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527972; cv=fail; b=PxoLchrHqTMy8i3qfNYrfflMRc79E43fh42UD8U39HAD6Z5KHLS7Hr7iN2yFpzjbLHaIbNw5KnKofSn7xoryR5AM5JbLXO/b7kDCEvTIoJRQGZ1saTnrDDeYURxNShOoGk4qz4bG2QphjAez++oV05L6vBfNnXN987McHrheOpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527972; c=relaxed/simple;
	bh=7+tATiyYP6mpLyIOZJHacgMfTunGhgGm3Qx2pIxkQfA=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=qsMagZccjKs7mztPu1G/B4RDyxZvtYiH6Dj66rPrwmDIC1YlkvA/ZW1G8o8JKNGkOeqj7pCbi7d9x1g6wNhYtXURAx4flnioja2DddFuKKq/tWYnws5QpbW7o6088QtNF4XbtkRtyC93q3vYLhM+QyayTWZ9fO95ugkrr1fMny8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qsJQFlbp; arc=fail smtp.client-ip=52.103.68.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qsJQFlbp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKjhRNxtzg8GfLiDhRorjN28ovzBsQmJKl7oVwHjPJxnB4UA7RIETk+qxZpuPegDVhTaXvBCAjvV66vBGqAR2d/SYIKotrOiNz0+ZiMhmP2E2+No/gNR9ztPG/3OBsnkIn46UcMfBTrRwbrc+fDOE095eAkhYyAvJJdfMLAGeNyQXPsqa7a2nm2lSv5T7xEUsDKTOAMM8tSDw0rK8Ts+zoqF6KfNpyoNDiaCw2ZJPaY18g5KAhcnN/+7lTL6Iu1HK5gqH+xp2HiAVY/fzCib3Acu7uzVSLoddRH2GMdLuEQFPssbk0sy3aVdbHDk+Isp6mwz6O3JKB0bmyAtTalyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ll9R0pvLoXDEQXyXq1+oxDC7gdopL6jhYvTpDNoKO8=;
 b=CNNWKzEJTqUVKhNPb+c1zE5MvG1dyOmrsngypQIjIzrFO44bj9v175jz1OG1FTE1fQT1tHcirI/lRE9M5p2grvrZYTGUll5K1TDFQ0JMoMJSUgcOW+UTHGYc6M3fua8wXdqnq3KG5FzQP8ZqIaJkIUZh4xwUO1trrMk8h3TztPVv4jmGK9gdTZchBI6Rcf503QY6bdbxKEUlmMGG4zHGc0CU9EwAIUDyKjV8tNqOqqDYyERn2IFGn93rwa07meWE7b6GktN2AMBfn8I0LJHaQTjlXWmkwWEBshISwGhQdJnUSxFOdiHqssn+hJZiQbQ01v8Bnga2G/qtx8svIIjXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ll9R0pvLoXDEQXyXq1+oxDC7gdopL6jhYvTpDNoKO8=;
 b=qsJQFlbpZO3rLDXgFVpj0jvocd6PgVfzypslDnfxBBoq4yBLaoktoO52eJmrykti7d+yfZvgpz7WM3FTI4Yr8iISm8z9ngpAE/FCt/v7yPKsm35K8rtTZmbopsqbQekV/whif3dRRycc5Cu4rYDSYh65hiPCsx8g5YjDhI7Z5B/N0DjOjplEZ7vAT2TcG9bSEJYXWVQTYq+sGol+PFYyJ9ro3l6IhHrRd6fQzKkyIqsWNrfv748api1n350OD2TYYNN6PNpVhdORni+qxlz0WANq1kEugNxWFfzPouY7g/xpeLmrKL2PCMklHFLaMwq2l/iGBMlxdDOKbB6UDmISmw==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PNZPR01MB10541.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:245::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 05:46:06 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 05:46:06 +0000
Message-ID:
 <MA5PR01MB1250046A9DEEE3A377E794A64FE352@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 30 Apr 2026 13:46:02 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Apr/30/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <f76932a0-1ea0-4c6f-bf0d-bcd24013f60d@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PNZPR01MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9c6cef-f97e-453d-5469-08dea67bc4b5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24121999003|25031999004|22091999003|55001999006|24021099003|8022599003|5072599009|41001999006|15080799012|8060799015|461199028|19110799012|23021999003|6090799003|22402599018|13041999003|1602099012|3412199025|440099028|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjFaQUlwWEdUaHVtSnJXOTV3cFhlWnJaVVEyc296V05oTThOSFFPSjR2ZlVi?=
 =?utf-8?B?K1BvMXAwc2xHT0pkMityOTFOb2hOZFZDYVVrOVlnSDlCWWdmMUFuVXdTcFVW?=
 =?utf-8?B?ZzNOSktwYXJzQ0FIY3dUTVVVZHJTYzFwQ050Sy9xZjhrUzR3bGN1RUFmMUlk?=
 =?utf-8?B?dTNtRDkwTVUwNmVDWTdmZS9Mb3ByajMwK0c1MFFYUWZBWktxa2piZk15RXZi?=
 =?utf-8?B?b3dsRy9teWNkWktjOTI5Qm5kR3BIdHhyL09zZWE5Uncyenl6cTFhSXhZelVU?=
 =?utf-8?B?MmpxQmp4VmpMdGlEQi8yWWRGWjBkUjNMWlE2TjIvUzRCcFh6N2lKN1NIVTVW?=
 =?utf-8?B?aXFaOGRvZmhXYmgyaWVQN3ExVFFReUVVdVJueHhYV3dFSUdvamJpK3FuaDd4?=
 =?utf-8?B?enBCSkJIMnZRaVBWY3JyTWl1Y3g4Y3QvT2ZOQnFBaXhRekJTUlgxYkNXZm5s?=
 =?utf-8?B?QVlOTS9zdWNQdHZkM01qYVdBd0hSSitZSU9pMFpvcUdQOUg1ektTeEMraUFk?=
 =?utf-8?B?WGNlZzBIcE5RQ2IrZWtGZVVYUzhQU20vd2J1TGVSaXljYVhIRGdvcDFSYWdm?=
 =?utf-8?B?TjRkT3h4SnQzRVVLWjJDSERMSUdtQXFiWjRsM2hRdFVLSFo0UjVTVE84ZXU5?=
 =?utf-8?B?eHFFdks2K29kUHMvS1JXaHpVTWFKb010cEZPUjdkbTRjSjBKMlNkV3FFa1dT?=
 =?utf-8?B?WTh0OXVSK0VlMUlUdTJIVnlIaDMxTGRhVGRsQTNITEpwUk5xYTVEbGg3clh3?=
 =?utf-8?B?UXNDa3F4WUVFa3Y0a3VIdmZuQ1oyNFk1eFVjTlo1Nm5JZFlWdGo5RnVYeC9W?=
 =?utf-8?B?SXhock9oZXBKbTNaUTdyK3lid0xrY0xYOEJKcWREeWtpb3V0K1VtRlpZWU9k?=
 =?utf-8?B?aWEwSGJPNW1jbmdramh5d1FDV1JDZGtQTktmK2pZOHdjdHUzM01uT3dQMktm?=
 =?utf-8?B?ZFRtUSs0OGdxK2RNdjJDQ1Q0TVB3cGpkV0ZSNlJ0d3d1djkyZ0I1T3U5NC9H?=
 =?utf-8?B?TEsrbTNtYzJZRy9DOWVGVDNtVEtWQmpENkRMMkNudG1qZlJ4M1hnaUxNZkZr?=
 =?utf-8?B?dndEajBLS1pHbEZSVHIyOTZYNFRwOTRDRGZtNWFWT3ZPamFXTy9TdXFicHJu?=
 =?utf-8?B?ekMxOG96RXpKMXZUYmc2dDM4d1VIVVZGTjBnSFRQekJqeStNaWYrT3hSSmkz?=
 =?utf-8?B?eHB6QnlYN1RGNk0wSkdCQXVxM08rWEMybWRKODlyL3dVQkRMTkI0WjRkb3FC?=
 =?utf-8?B?MHVnSFQvNlBaZmRSTk5EaWpMdEI3TWJHcUVveW1YdktQcXFHMzZFM01YaS9B?=
 =?utf-8?B?WVV4bkRSYnJIbFhFeGMzaXBFLy9nbXF2YndJY01XV0NCMitBcFB3eDd2OEQ0?=
 =?utf-8?B?cG5pUlY5RnZVT3dLWDNqMWVPSnN0TGJwWkFjMG9QS1lYejRZNmxEMS9ON2ZV?=
 =?utf-8?B?VkdYbk10YzV6bEIvZnh4ME03UXdJWmw0YWdhWk1GMWpOelZGVWxKdFd2TjRy?=
 =?utf-8?B?N2lMRGVEOFlxUXliRjd0dC91a0ZFdHBXZzJHMUpuY2pJZ3orTDlDZmxVL3NF?=
 =?utf-8?B?M1lBcFNXdzFadXdBcEZJQ1Z0YjRtV1V6TDBYN3RtOFI2R0JHNVR4clAvNkc2?=
 =?utf-8?B?QjVJakFLVjc3LytDTmdKZmxkY3RhT1E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mlh1MXk1SHp1emhPYnBqNWQ2dlZ1MFV0dGJWVUgvUzVNbXhDNU5MZ25ESjh6?=
 =?utf-8?B?bzU1OExQaU9Bc3FZVGxsWXNDNTFmNjFuWWRWVzFtMkIwY2Q1RC9CeG44Y2xC?=
 =?utf-8?B?NWMxQVVZTlg3NkdrYi9zcEFROVhMOEJZS1lDelppc00yZmZ1cms1R2NNSTM2?=
 =?utf-8?B?aC9lS010NFZiZGVLajg2clUzVlBBam9LYXBaUWlRODBxQmVpTmJWcEtQajJO?=
 =?utf-8?B?eTV0bnNsRVUzZEZOVUlEaDlhU3FwYlVLSzhMclFvOE9iNG9DM1hWSjc0TERh?=
 =?utf-8?B?alFsTERpVzZDY2xaanJ6ekNKeGJGdTg2ZHNFN0lCOUl2TGs5djN6UmFRZHZl?=
 =?utf-8?B?K21aaHM0WXZoMVhSNG5oNWR4dk1XRTRaa2FkZDh5eGdmSmxBblhxMllMTms5?=
 =?utf-8?B?akllTS94d0hDQWJsazN1ZDFHU3J2bGR5YXA1STRueWxIWnFtMkJIMXpVTWZY?=
 =?utf-8?B?TXZGM2F3TXQ2eVdWUzIxVVhvVTQ0NlUrbU9NMlBaNkVtOG11S3RCRGtSUy9E?=
 =?utf-8?B?VVNzRk12YklnSVQydFRzZkdXZGNKODl3TFQzVW1RQVJaK1h2aExkOGZmMnJs?=
 =?utf-8?B?Zi83VlFQM2NZS0FkOUFhOU1GcjM3c0pnS3lvQURtNzZkQm11Z1NRdjd3Vmhs?=
 =?utf-8?B?ajJOc25wOTV4K053T2hiU1NIdkZUSElvWFdzSXlsRUZoU0ZVanRERE1KRjVQ?=
 =?utf-8?B?RUtmK3JxY2RtTWlMSXpFV3FDZzJSNzdoWDdQNlBXc05pcTlFTSs0aDdZcjls?=
 =?utf-8?B?RTE0RGlNaDZ2azM1Mk9odGVPcjd2VERrTlRwOUFROW8zZmZEajQvYmgydks2?=
 =?utf-8?B?aS9XeGliazBFSXhHeE5QNUxhYzJwTWd2R1VPb3RMalhSTFlvdGJVRnlJZmtX?=
 =?utf-8?B?bkVvRnhMWkdRNGI0S2ZJRFpyUWhVMHlZQ0x5N2dUb3JkUnpkb1YzVDJzeTJG?=
 =?utf-8?B?RHFVUGxUZWZWcDBicjBzQXNuRDI4alAzS2szYUZlQVY2bVNMOUkwTkdtRUwz?=
 =?utf-8?B?UFpMMVJ0M0Q1NUV5K2l1S1pNK2QvZ3pRTzJoajNTbHBrNGdOaWg1N2EyUEVU?=
 =?utf-8?B?eUFsdXNIUkRZV3lISnlzcFhMWVB4Z1g1NzhScXhsNmh0RDNyMUNnTVl3YXZL?=
 =?utf-8?B?Wm81eUc1ZkpRSHViYzltQy8wTUhnSVdxaE91VGNUaFpZTHhPTzFEb2RBemEx?=
 =?utf-8?B?R1lRWjRRd25Kc3hwOVdRa2NmMjR4N0pzZHM2c0Rnd2VVaVJ2ZnorSjg2c2F0?=
 =?utf-8?B?VUowbHhXbjNHSnNkb0pBL0RLaG1aeE1VZStwQ041MWl3czNMQk1pSWtidk5B?=
 =?utf-8?B?dHlSVVBQWStRcHZjVXJzZHN0OHRWNExQdEtjN1h3OHg4bzVCMk03WWxGTFRn?=
 =?utf-8?B?TDlUZmJxaGsxYks2NFJXTnk2anhWekVQZ0JTQndWU3NZOXVjaWdOVGFkdy9n?=
 =?utf-8?B?UWNwTE9HQ0dwME5ML0ZIUllHeXNHd1hRMkhXaENRZUZ5c0drOU1ORG1seC9S?=
 =?utf-8?B?YVQvTVlnQXhTQnhwcUw3Qys1U1AzWkRob3JUUGhOV0pHZzZNckE2T2Q5N0Iz?=
 =?utf-8?B?TnByZEh5UG9EdXNRWm16a2xFQ0JnT0EyUWxYcUZQSGJ5WTVaWm44dlEzbk5h?=
 =?utf-8?B?ZTNLbTIxbTRXWkt5Sys3Q01SdllzUlFTejRuWEFLaFlKdkpMWVVaWjF3RlFt?=
 =?utf-8?B?WlEzQ203cmtlQU11YzBLeVZ0YVQrbk9MdWxqTUFXcVJjMGZZZm5RZjZITXpX?=
 =?utf-8?B?R013K0UrcDJYMTdXRHRIcEVnMmx1TFZnTkpIdkdrbkhVVUhJZE12TFVJTkhZ?=
 =?utf-8?B?MjJheHA0RStHUk0wZUNUaWEyTUQ2cjRPWDFIdU5NdzFVVEl6YzRoMTVnY3Zs?=
 =?utf-8?B?TFlnZ0NxTWhMV3habWlrUEJsREEzZ0VvdXl5UDlYSVhVUmpBclN4L21helc4?=
 =?utf-8?Q?jOCxuWFWMAKSXolWzFq5PjWPCdtzK+e8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9c6cef-f97e-453d-5469-08dea67bc4b5
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 05:46:06.2678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB10541

Linux Upstream Status updated: Apr/30/2026 
@https://github.com/sophgo/linux/wiki

CV18xx:
- allow DMA multiplexer set channel number for DMA controller: DTS part 
was rejected when PR, revised to v5.

SG2042:
- Avoid L0s and L1 on PCIe Root Ports: upgraded to v3 and applied by 
pci: picked by v7.1.
- Fix SoC module in the module description string: picked in v7.1.
- Fix CPU unit address: updated to v2

SG2044:
- Fix SoC module in the module description string: picked in v7.1.
- Fix CPU unit address: updated to v2

Thanks,

Chen

