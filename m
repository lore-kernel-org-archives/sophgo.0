Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011038.outbound.protection.outlook.com [52.103.67.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057CF38FB0
	for <sophgo@lists.linux.dev>; Thu, 29 May 2025 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748487048; cv=fail; b=Gf4XYxET22GaYHqAYEWsCwqacWI/+kPOTVMqPQarTfWgSSK3W2sRBe/2hDLFgUBBvIYiOlTYlbc2AXHt0u5oEQRICzTjbVugfFwvqVJNIQziyCSMtZZUSDD8Nb84XHFD+Dur5hhrzOuxH4xs4okbTTzmEqKhbkAWbVYP6INvj7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748487048; c=relaxed/simple;
	bh=O9wnaLSmU72B8yDLPm7AYi3LKd0Ae/kOZtOGjxNsldk=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=Yk0ONisgIIfZqh00OGeJILRm+0cNAiAvSdnkhqxaM6xsViPNb/5prHKZTY1JZ6g6BtT0/D5I20hB/iCIZBSer45wrH+2E6vMVC2msgeXn4dyCPHniUh3OZgEDsB7U+9HouDwKcUwmdgEnqab05g/Sb/Q9eMgMBJT1krTAxxQxNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qfgbRDnw; arc=fail smtp.client-ip=52.103.67.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qfgbRDnw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNBS9+tKbsvoAl4lThKBa9JBALehwE3MjymrdpGm9j7cyGjky3icBkf8CTUTGDsPq28YcSgEzViIheC4T38hzpDytVXIqr4zDjJ6fuMlmHfhdwqV7p7bISaF65rj12fPSl13ktOLNOEHV3tvzjVMqg6xyTEySFMQ38iDh8OcEjgeRmglpsvhKTC7OiLX3xMB4jfSTa8krTydJv0gBRXF4pMn8PHOidWZHaXTBhvayDqJAWgUxDIp5HSwdn2QF38GBUezJp27vUKBq9uyd6Cm8ap9gaZRmSbcbWJN9pMpumXpepvkzDzuAIulcVobsu2riZVxPPCydhgyur1sbN48VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbpc+d6A8fYTLE7sSeqINLTXvBeM3V3vJcNO7LM8ut8=;
 b=RQTpSmKT0WD8SUr5IIOkA9r2N9r/VilEO/zOqwXo1aNGpqvNO3k2toYhAXMGh1N1gxRuXRNxp6B5j5ImWwlrfmKMILOh6EIs4Gjs+QO2HjLSdFKWpULNB+ZBJk2he5/1Lc/9T9F5yFWjKvXaPhoSm1cAnoU+wc+3XWFS6a/1pZAkTEoxx0bU1TTrRPKkydJm8P+ZHW2fL79T83YR45tejTT5uCkDLoqZRNtC17EFk/9U4cC8B50xnjJqyRrsLPNQBox+7W0X57Xl0mv8g13as0Tq/vLGHofgUMKUi7tGhJRw4hnbi7ut7liDl4N9/9vKwVLDOsPS8VY5VRcyPzSNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbpc+d6A8fYTLE7sSeqINLTXvBeM3V3vJcNO7LM8ut8=;
 b=qfgbRDnw7Mn4UJXRhXxwnEfyrA8PgUhjcJzUxc2F5Oacazx+IrakUWecbQ4F9vzH3WPfw/V+oi6+WCvalitx+dguXoOs7y/6q/9SJzN2lQ+DD3LWPR9/+7+MFHoXNx5gPu7sgnEUVLny3Rc7p4EvkBZJIFj8xaAyNuuZcvVI6p8LmYtAiVUc9qbXhhYHXVPDD7wmSk0+DhzRol4SfvZDSQXx0mc7Fgju77Jw9B7R4M14f6JF5UVBBb2rb0uBccM/uN6yhdxxuDqZJbnG2lU2a8Trcxrqc3+T0uAp7YxEiNLz1oHDwn/VLz41P8sbmD8MZLbxEh9gB++RInzohaiZsw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PNYP287MB4150.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 02:50:42 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 02:50:42 +0000
Message-ID:
 <MA0P287MB226206990D65DB5AF7133264FE66A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 29 May 2025 10:50:39 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: May/28/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:3:17::31) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <67ae36ec-fbd4-4654-a452-2230bddefbe3@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PNYP287MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 3508b525-7757-4b15-c9e0-08dd9e5b99ec
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799006|8060799009|15080799009|7092599006|5072599009|22402599018|461199028|6090799003|13041999003|440099028|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmdabzlTY2tyUE9BWHgzUC90L20xY1ZnSjNMU0ZFMi9MdEJQd1c2Zml1Q1p4?=
 =?utf-8?B?ck5oUjZDTEtYSmh2clhxNE9jY3o3UnJJZnoxUUQzSlFtT3Zjc2hHS0NMcVlo?=
 =?utf-8?B?QnBTZ1lZT2dhSEFtZHo0UFphOVRJc0FtRzJSZWZob09XMTBUVmFiZFkrT2Z5?=
 =?utf-8?B?Tm42MTdrZ0dwNTNuZVBWZ2N4dEhMdmVkeC90QzFjK1NmZ3ptQThYSEw2TTZL?=
 =?utf-8?B?am1BbTh6eG1kRXQ1NmdRR1BDYTRpbGhSakFQVkI4Szd6L1pyRE1QbUpWYVAr?=
 =?utf-8?B?Y1Eyb2c3RStnYk5PeVhDOXNack5GV2l0MkxTZ1hyQWJHNkFkRnp4dXE2NWpW?=
 =?utf-8?B?eVlUVUVOV1BOMlRBQVFlUHJuMUxWK0NPZUYwWUI0ZVRZeDJHR2I0UDVSRFNG?=
 =?utf-8?B?eFowMFJ5ajNjTkh2YmFUMVFBWW5JeW1IRU12WitoUTV5M3JncENHVDJZREpJ?=
 =?utf-8?B?Y2hPbmszMzZ6TGJWUlVKZWpVeG1lNFZmbmRGSE5EZlJQZ21HeWl5WG82NDFr?=
 =?utf-8?B?dTBWTEx4NEFmSkFmR2ZyamJEMnVlTy9EUFc1YWdGWEo0NEFGbUtjbzhpd29S?=
 =?utf-8?B?VHk1TXluejhCRmpvWDFIeGVTdmhnRktZb3VBZlBkaUhJU0N3U3B3OUY4cHdx?=
 =?utf-8?B?YTVqNk85dHRBaXU0SFkzSVlXZUI3Z3FSTktpZjB2T0Q2RmVpdDJsQzhIdyto?=
 =?utf-8?B?US9sN1JOU1dVVnBrS2RidndwRXRtbWhQMFBUa1BVNzY0QkFYV05DaC9kZXYv?=
 =?utf-8?B?N3ZwZ2VtMkswUU91RkpyZmdtaTg1RVJjaDI5Nm85N1JvdEVOOTdRSlI0SzRC?=
 =?utf-8?B?WWJIQlN6UEZXWGJNRE1wZ0dmN001RE9lekVpS3hKRGtCYUFLUE03dE5TbkVa?=
 =?utf-8?B?di82TUpxQlliV24vYzZZNnRJemRTMnVWQTI5dU1hM1h1bnN5V1dNUTFWb1hT?=
 =?utf-8?B?dkRWL0o3a3FYaWJ0SUUvZnk2WSt6RkRHTU9tbXN6ZXJnS0RSbnovVFVyOUxo?=
 =?utf-8?B?VUZ0TGFxY1RwWnMwZVFTdGtVNy9zbTdNN0UyY0ZZdEdFY3J0NENma3lUU0VT?=
 =?utf-8?B?UDdFMm1XRElQcW9WL1IyZ0RGanJwN2R6a2pWRVBLc2x0enliWS9XSGJsbWJY?=
 =?utf-8?B?Mnl0RnNYM1JaMzFicnlQbktyTVo1Sm1IVkZVQUZDSXpya0p5M1VocG5KUTBi?=
 =?utf-8?B?WStkMGczVGpqUXlieUpmZHZ2bW9JNHljMTZLNUV6MGs4MC82RkF6eERCVXB0?=
 =?utf-8?B?UVRBUmpKWXFZYmNjaklBNnhxdVdhVVZZcWdSUUZ2V25sSWJ5aCswdEtDM21z?=
 =?utf-8?B?OWtzTXNibGRCd1NydEJHMVpuaHFuTml1T3FmWG5TdVRPK2Q5NEpnNmtkRVBB?=
 =?utf-8?B?akNZalY3N3NDOUlGNXVlelRITU05RmtyeDFndUhjTWxvbmRBN3JFRjdaWUNL?=
 =?utf-8?B?Tzc0aGFWWW5DUEhFZGU2ZC9SR3cwOXVaSE1EMWc5Y2FIeTF4T3JoNTNYTDJn?=
 =?utf-8?B?QldEOUltTTVJU3gxbmF3MVJsVlRGSkY4S2pnNEhRQTNPdTl6VHVRTHYxQitm?=
 =?utf-8?B?ZHhLelBqc0h1b3JNZERLL2ZlcW4zR3Nvc0NUNVBxbXEya08yUDdqZ1NwVEJk?=
 =?utf-8?B?UVJlS2hGUFRKWWk2SnBaOEdobnQyV2phWlQ2MDI5SDlkR0VRM3BYeTZncWlj?=
 =?utf-8?B?dnMxbVltYzRPeHdpdTUyTjlTem5Ra1Zrc21HY21DSUZaU2RPQ2MzZFlvb296?=
 =?utf-8?Q?B7ETVdx53yeT0t84S4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVF5UHM1SGVOUHlkb1MvUjNCZm0xQUVqSis3dnVZVjVsUkhsbGh4Rk9kQkox?=
 =?utf-8?B?anhwcVl4WHEwcWVDUGhqUGJvU2RNcU5GaEoyUXFiY3ZRN2Zhc1hldEMzaitp?=
 =?utf-8?B?bTdLeGxaaFE1K24rTi9HWTNPSS9xeENPS1hwTVl6ZEc5UEtVelVkcWlpeEpn?=
 =?utf-8?B?OW5oVG1TRldBUTBSb0NOakoyd0UwSWdxWHVHVkZWU3VCeVcyRkVJS2cyaGZj?=
 =?utf-8?B?TGUzVng4VEhIU21kbVVlRWwzbkdZQ1RwNlFRVittdU9XWlhkNVpaR1RlV1c4?=
 =?utf-8?B?dTNicno2SXljTlZQeHpsYlN6ZUs5YW9nWmJOWEplK1BYQnRBWXc2MitQenFk?=
 =?utf-8?B?WVFwYk92bVp1R3F0L0lUWkpIY3FCRWxPNUNpTXkyZk9CTEsrdXQxWmgwZXVp?=
 =?utf-8?B?UXRFOHBsOUE4UXlpQysrM2VYb1VIQWgvY1c2Q294TUJZWWxaS0xPLzVsUmp1?=
 =?utf-8?B?L0dRVTVDb0RrSUx6ZkYxYVZsOFlvbEhPRHRlY0FuaXNhVnQxZUNZUkc1aFhv?=
 =?utf-8?B?aGZjL0E3SzlzZkpnODc2Nnd4OHlGdzJya0pISWNaMWhqcmhlcmdnYkZxWDM0?=
 =?utf-8?B?OXhmNnRGaTdmNnE1dklhdDRJdDNVeTdoWDIwN00wMmJoR2N0UVlDNVJtUnlS?=
 =?utf-8?B?WjFybUJIZVo1anRWcU1VQjZGUnl1cUkwbzJ4eFNpWlNqVUd2WTZ2eW16d214?=
 =?utf-8?B?ZXl1YVB4Q25YQVptS28xR3hJL1hrNkJqQStlTDBURWF1SnJ6K0JlZm1kbDdU?=
 =?utf-8?B?bHBZcEVzTnhSWk9CYjAyZHVWNktrdlJ1UWw2OXZNWjdCcnRKYm1GdktsYzJy?=
 =?utf-8?B?a24zSUpiclJWOWVnUVdrQkpXNGFRZG9zaUFCMGtoMVVjWHpGeEc5UWR6b2VE?=
 =?utf-8?B?TU15SWRiM0hGL3o5dzd0OHlTUDFHWmpWdHZvZUJnMVFlbnNhaGcxQjdiajZT?=
 =?utf-8?B?YytsUG13RXdkM2hKM1R1RkVxK2dqcnhRSktySHQzZG9ZODY1Ris2R2tqd0ZX?=
 =?utf-8?B?VUJCcE1INDJzeUUwUkZtNHczbUJPT3N0cy9YWXdqcHB5bFg5NUEyR3BxR1Vy?=
 =?utf-8?B?c0tqWjBabENLbGZ6NDBEQ2J1Wm9DTlhyRTFHTFdXMWNsTTdkbmFBUDV4Q2RB?=
 =?utf-8?B?V0ZFK0pUVWpZWFRUTm9meGMrb0p3QTVKVTlSUExsMzF5SklxVFl1a3FwNlpq?=
 =?utf-8?B?UGx5OWhXeDQ0NGxtZkg2S005MHdWc2UwMGhBNUNrMXpMZXlETWplZGQvbytk?=
 =?utf-8?B?a1YvLzUzTTdRZUswcEFoM1JtMEVjZHJxQ0xDR2RYYzVrb01ReUllZWd4Lzh1?=
 =?utf-8?B?VzdodWE1M2g2ZnpNUVVEc1FLQ2hEdk1xQXJmbEpTWXU2MTFnbHF2VDJhRkhp?=
 =?utf-8?B?QVc2K0FoeHdCczNNTGUwaGhmdjN6MnRHSWJxZmRjaXUvNi8vTVBHaWNhK0ds?=
 =?utf-8?B?YTlZVWpUaGtFZ3FsM0p3YVJMRXZQRXJoaDF0SmpqSVA2ampTTjljZ21jSlZq?=
 =?utf-8?B?aXNVRm9FNWFrU3lIdWRxT04rSC9FeTRQcUxJanBUN2VFM1cvYVVyY3U5M0lr?=
 =?utf-8?B?azcrLzhnRTBodGgvclZyMVVrcHp2V1ArRlZBZ1ZCcjR3SUxvVEkvbVI2cldE?=
 =?utf-8?B?RFNQQlMwczN0RGp3Mkx1dnl1WjByQ25UKzFwbWZtUSt0RHVHTFRKb2FkRUx0?=
 =?utf-8?B?b2oyVmtoUlBGUWtqMkl4UUtjYUNDM0FTTG1ZOTgvMXgya1VPOVRZQWIvYXFV?=
 =?utf-8?Q?aq5E5oGwxxOPPq+yHX5rdFsIFAAIjxXYtjK9DyR?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3508b525-7757-4b15-c9e0-08dd9e5b99ec
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 02:50:42.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4150

Diff:

https://github.com/sophgo/linux/wiki/Home/_compare/428db3f6635e4d215566a4bf302116766b2ccdeb...c67590a671b232194502bc42c094e1b0af2e219b

Last updated: May/28/2025

Quick Summary:
- CV18xx: dts part changes about RTCSYS will be picked to 
sophgo/for-next, may need rebase?
- CV18xx: RTC has been applied in abelloni/rtc-next, expected to be 
merged into v6.16.
- CV18xx: mailbox is updated to v4.
- SG2042: SPI FMC is updated to v2, binding changes are applied on 
spi/for-next, others are still in reviewing.
- SG2042: supporting new EVB boards is updated to v2.
- SG2042: add more sg2042 isa extension support, updated to v2.
- SG2044: clock has been accepted and picked in clk-next, expected to be 
merged into v6.16.
- SG2044: PCIe is updated to v2.
- SG2044: PWM is updated to v5.

Thanks,

Chen


