Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010005.outbound.protection.outlook.com [52.103.67.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0020E702
	for <sophgo@lists.linux.dev>; Wed,  2 Sep 2026 02:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788317656; cv=fail; b=tJ1h9QxIu7zJ5pCnTToLZaMaUttUpzxq0Dp/A0xgWB34xFgcvCHtcatj7g2BHiaeuFrG59YxoBFguHqQljzwY8350gOGMWTQunDFNvZUk0ELAnbVM86FBqWtUTwwtHXG2YmeQKWJ/1pM/JwcFSX94E95vusnBGZzrwFl/pYFG9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788317656; c=relaxed/simple;
	bh=Ln8iIWMSpQJOD34p0R4uh77ONf8fQnF7p/7tCezSns4=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=lRaBUkRGcAkNJqhB00FXI6TwvgwT8f9y7jMU5kP8np0T0khU5fBVhhpQl+rZJ2MUnLucknq7nhnlqnKERXKN3J8miM5KelV33YxJbTh+O8TYiDJqbY66kH4jwvojJoMM+1Wj6Mu/Z3gvT2B7BCd0+DqRSalO8YAxiEbUqQEQTgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RW8EHpSJ; arc=fail smtp.client-ip=52.103.67.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RW8EHpSJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvpLSkjfrjA8cpwoKSj/n6JbbfDM+RExJ6Sju101MHvN/viO86+0qLnazcUbZshS6ot9evC5dalSIhFRWOX2+Ld5oB1fabi8cTp76g7ddMmpam6/7IjwErcQr0TsS8dS+DfGlGx9STjOQ4hXX2LUpgpXyjIMwNHrAYpdzGi1l1P/G6bHWOhCujQTkUEuZTZNb0OyP/kCzcnap0onPLiagH3LuwROlFweohUkm+OSerWpnP9aHsB810FivXpu1aSspUWyo9Iw1kFytlJ1iNK5g843nSCPNPApuQPLVfZkEHhE+insJKYqjaiOi4aTYLoTMePEoVkzbGZ2SwopvnUm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hURiV+RSHZi5RCf3zzacpsX7TEoVzGyxwBHLOTPxQ3o=;
 b=YdEltqt+mnZTo12Ndg/v3tTEvT37C1WyPm2PZjGr1FcYbMDPzWynfKy50pmyJpHgNkDExq2kNUgkZV+VSXVEBUvOPutNfPo/VCh9Mcr1MDxtMpR4Aae21GLHD/tCfHu0TtvXF+XKIhst+qZVEs56uEvrdpzFPv5fFUztV6ogwKiX/lponwTlSeejlBLxzpBRkqhCStPW0mB3KHm+265nsZpVgpVhB3NarNmp15BwBeBTbJ7FvYIh5XNYkq0wT/K7HmwV/8OY+C9HPBsMrcDiYRPCbb2yFZ3cwsBF5ai4jmoc1Iq9CXMg0ucxaO/sIigcLyv92pfJX8SPPbwlxw3MfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hURiV+RSHZi5RCf3zzacpsX7TEoVzGyxwBHLOTPxQ3o=;
 b=RW8EHpSJJxvMH5iYHRzBOUhsYeUwf0eCzksUbv64+8joosVNVHWMj0QmsnRh08Hh6VVx8zby/J0L7kHw03JTNfzLS/Hiyv5lcavOurNMWuhOfUisU4YhLLSm9yik3yJdx+cqnzt4fkSxKtRHujpcO2UxPlGzCjNoHPv6qDypiYuoQPrf+mIAi71cy+K3jf2tX2oYg4NfmvFoqxTqn44+v/BpX/ywLk/BflcsrQAvFq9WjWtPevnA2VQWMEt6Uhglnn1iM1zUZOWmzI/yCQSLiJkRCqGJmf7Fpk6k5Y6ZvxZqeoc3HA/sX5uqy8vsP1QoHP0clFITxBeq39fEDnhBpA==
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:230::5)
 by PN2P287MB1454.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 02:54:10 +0000
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73]) by MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73%6]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 02:54:10 +0000
Message-ID:
 <MA5P287MB6080B800F49DD04AD0F46714FEB72@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 2 Sep 2026 10:54:06 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Sep/2/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:230::5)
X-Microsoft-Original-Message-ID:
 <fb866834-0d27-422c-aaba-83952b7807a2@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB6080:EE_|PN2P287MB1454:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae8dfcc-ea0b-467d-c49b-08df089d7676
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24071999003|25010399006|15080799012|5072599009|6090799003|4140399003|22402599018|20031999006|8060799015|19110799012|24121999003|22091999003|25031999004|23021999003|24021099003|39105399006|440099028|3412199025|4302099013|1602099012|40105399003|25131999003|2607281247196008|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eThQeGpjb293OStMMDdnOWh1bWZtR21DTWxzYVhoZkRVcFh2MzREbVA5MjIx?=
 =?utf-8?B?SmE2dXl0d1JYSG1VeVNxNEFsZ0pucFlHekFFODkzeGhKTEdVbUIwK245ZXRG?=
 =?utf-8?B?TnQ0SlByVGN0eGVjNmE1SElVb1BScXZnbXJhSVdRMnFMZHQ0ME1KNVpKQkp1?=
 =?utf-8?B?ckk5R1RyaUZpdXA3Q25ISTBud3E2eG1OYkFReGVob01kRmkrazlqQXlaSVFu?=
 =?utf-8?B?Qm8ybEN6aVR2bFk5RXdUQmhRQWY3NTVpRnE0RHF6VmdQSkFwT1JvZHF6d2Mr?=
 =?utf-8?B?M1FtUFJvbzNZQ29KSHhrVTR1UzlwZ25ibHdLQkphY29kVWZJTk9YUEdQRnJX?=
 =?utf-8?B?MkMwRmJxaWt2RHowcy9CQWZycDRFeTRsZW5Ta3N5dTNTNlpLVjc2d2RqZlZL?=
 =?utf-8?B?YksxbWcwMGszZ1NPL0M5QjFoU2k5UERwQzN3OWp6OG1GYk55amUxUVRnZW5X?=
 =?utf-8?B?OG0xYmpyRWkrQnU4bFhHYnArVEpBRFFjNmZHS2FPS2FYODBRUk4xdG40RkRU?=
 =?utf-8?B?K1JsQ1BwVUJNdDFwb0F3Y05HL1dRU0pFdHBmRHNQNWo1TFFRMWl5Z0tVY2N3?=
 =?utf-8?B?bGZCQUM1SW9zMGpnbHNIZG9NVnNETFpPWXFJZjZKYlY2QUVTMHgvTFJpeVN3?=
 =?utf-8?B?aklpZ3ZYRkdQRitMcTZ6UG1QMDVUUkNwUmtxbWJKM0YxR3pTcSsvRUw2Rits?=
 =?utf-8?B?S2ExODgzVlRkUWlQT1V3VWtDZFhwQmFkZkpnbFJkMTlOVnFKWG1FQmw1NXNZ?=
 =?utf-8?B?bzc3N0IzUWNZTWt1a3krejdDMjVuTGMyV2VCZ3lvY2pZQkp4MkhleGdNS0R5?=
 =?utf-8?B?ZkJpZlhVUC9PZVYwL2lFUXFEQ2VNditIdlpzeXd0bmlSUzltaEZhRG95TUFV?=
 =?utf-8?B?VEwwTTAxdHQ2ZElJM2dpRC92QWZldkZNakMzWU1jSVp5Zlk5T29vVGttaHBY?=
 =?utf-8?B?Q1g4ZDB6UXBGZ2hBTnQ4N1hwbm9xYmhpcUNYTzNIcnNmcUNrQlM3ZzZzOEdO?=
 =?utf-8?B?bkhjK0NzVFNDN0ZienBWQ0hacERKeVZWajA1L2xLeFprVGR5VEQ3c2dMdFI3?=
 =?utf-8?B?aXNNNDMzK3NYVXcrYjdtRFByaE5zNS9iRFM4SVpMMWZNbVBBVEsyTHpKQTJL?=
 =?utf-8?B?QTN3QVcrT2d1aGdkNEtFSkJZckcwejFFK3pxdlRtNDlvYzRuOGxMaUozMlBy?=
 =?utf-8?B?N0w0dEFHNUNoUXRCMU9zaDM2SnZsRnphdHRQeUJCcEpjZElna3NWTFlkWHQy?=
 =?utf-8?B?Ymt1MEREeFNyekJGNW5UMnRzb1ErN21ZRHoydDZvOE1HQW9CQXBXNFF1cnYr?=
 =?utf-8?B?ZDl2OXlGaU03Wlo2N3NYTGFxcjEweCtlMjg3bDNTV0Q4SGg1QWhrSTBKYmZB?=
 =?utf-8?B?ZFlaYkhuMFFESE9xcVhKTVJrTzduNnU4eEJEVXVKMzI4cFpsUk5zSTkzOHBq?=
 =?utf-8?B?RVMwb0s2czNRN1I1WXlZcTMxSlBHK2tYYWRyamNxVHFMOHBVc2c3NncycWxV?=
 =?utf-8?B?bk5RVFQxRlppTlhwWmVVNVp0WnB5eXd0dFVudjhPeCtqRTJpcDBZa0tHcjdZ?=
 =?utf-8?B?dnVzREFIcnZDNFlkYmpLYWxMelFGZkozL2FJWkxDRHE3NU5SVEhXNWZBSStu?=
 =?utf-8?B?cndnQ2lvTHZOclM3ODVJeHpCTlYxY1E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVVMOVh5MTVxLzhnVlpQaDNzTzhDb3B2V29jMEJiRlM3NWJPR3BGejZTYmNh?=
 =?utf-8?B?ZHpVMUZPb3c3OWtFb1BxK1h3amZSM3MxU2dIRGRQQVVrWGdLRVVpeDBDZjRC?=
 =?utf-8?B?Vmd2TUpOWW9JVXJISmg0cTc4WEYyb0o5eUN6aEx6ZXM4TGtIcnZmTzF1MlZi?=
 =?utf-8?B?SitlTnRVTTlaaVFjTFZSUFhlVzdpd2llVi8zV3RMdnl6STI5b1pxamMzdU9w?=
 =?utf-8?B?b092UlFlODRCaWZZVG9raXo3Vy9BZzlyUmkyVTFtdzU0WXdiWTNsdFRvL3pk?=
 =?utf-8?B?eWZRSFh1aElYL0RnU3ErbWx3UE8wbXltSzFJd2xyNHJyeVJUWGdXUGo3RjN6?=
 =?utf-8?B?ZGdNTzlRYnJxNUI0V1h4aWtnZjRvekJVdW1OczhRRGlVT1dqOHlVWTJicElv?=
 =?utf-8?B?S2s2dDZNR1pMczJKSm1VY1NvZWQ1VFgzcGxXNzc3SGlhMGRLbUwrT3MyWisx?=
 =?utf-8?B?MXRGQ2g4eGtQUFNiMUZuVmFUcEY4OWVJTWFOUERaZG1uQnJBZUxhT2dRZ1Qv?=
 =?utf-8?B?bmM2Sjc2WGdLYWxBSCtXQ3pqbmcrbHo3MXh1ekk3Ym4xYTFsRUp6ZTR0QW8v?=
 =?utf-8?B?a2VPL1ExbUZBR3Vqck1Lb1ZWbVphYkQ0UDdocXIxU09OL3dZVTVnbDJRcVM0?=
 =?utf-8?B?Nk1uWHJiNy83bG5Qc2pORWxURHhVWElyOWhycFlFc2FFK0xGTTkzTjlnOHhM?=
 =?utf-8?B?cERrOFZZSWhDR21yZk5wS3A4ZFRiS3BhOFZMMmhVajJ2UC9KbFE2dndLZ1dm?=
 =?utf-8?B?cXJ0azNwenBvL0x5UUtSeUVkaFVUdVZ6OHV3VzB4cHNFekdQekxDKzg2L3VK?=
 =?utf-8?B?eHREMG9ZODFVVld4UFZ3WVUvQzMvUWNiMlBlYk9oNXhTU1VTOHpjeWIvOHNs?=
 =?utf-8?B?K3dtSGY4NC8yUnR3RjZFc0dJdmFPb09RdW9JdkN0a25YZmh5ei93U3gwakc0?=
 =?utf-8?B?N1Nld3ZTamE0NnFWQnNQeGh3NERIeWxXN1ArSkFNQ2N6NWdWTWl3YmM5NnNo?=
 =?utf-8?B?Y0J4RUJ3MHlmcDZadHhuWVNJQjVLc21SQk52N1RxajBpWFVIS2Fsb21Bbkdh?=
 =?utf-8?B?eExoR3RYRWo0eEZrSXFjR3FubFpmeVN3MTRqY0llSUk1bnpvS1pMK1Q5ellx?=
 =?utf-8?B?UzA0T0JieExEZHFvWjlJb3pVbStsTHRZb2I2NUpzM2FzMFdlNGp5UlhqNzVt?=
 =?utf-8?B?Mm9TbEpvNkUzeUNQY3JNTGtONzIrNURtZFdGcWh4SzhUaGtpc0N0NE5zY2pF?=
 =?utf-8?B?cDVmTlN6dDFObk5OMUwrUnBrbkZGeXNpTHBPMjM0UUV6MGpkck85VTA3MnNG?=
 =?utf-8?B?TVptUmsxdXdKaGVuVUxxUEZnSWJKQ290d2d3djhwcyt4dVNVb3Q3T0QySElz?=
 =?utf-8?B?MXhuNDdKYjVPUzl5a2tSUG02TlBWTUQ5VzF3THgxUnpQSGdIUEZMVXp2b243?=
 =?utf-8?B?U3N1aVV6VU9GQzFmMzh5Rm9zN1crdDNiUDc3d3BoTUJOQlhWdS9GNGVKWkFN?=
 =?utf-8?B?M1JsVnowaE01cUxiUWluMkluMmZQWHgvRk1WMGcwcFVIYm54bWVOYnpOQzc3?=
 =?utf-8?B?U3N0bHA4UGNxQUdLVFZQS3NDOUNkdTdRTVArWVZEL1hFQW1UREQ3TTVKekdY?=
 =?utf-8?B?RERXVk9CbzI0YXFVcyswWTNHS2t4VTE1Mk9NYVl1d240OEUxTUR4S1dJNHdh?=
 =?utf-8?B?aVQ4eTRTZWdFV0dOYm1kVEwySjc2Z3hnN1EzaUZsRE9zRmg2RklvVGw0N0c1?=
 =?utf-8?B?eVJMTU0ySk1VZzlodVNRSWcwcHRqSEpHK0w0UzVycGNyUFBaSnd1R1MrVjYz?=
 =?utf-8?B?UHJkajZkTjY5Y3FjSnc0VFZieFpCMVBRVEJlOVErKzFyTFhBb1VES1ZDNENo?=
 =?utf-8?B?RnIrMEpLWmFZMVFGZktPZjZwTDZsY1F1VkI5UGliV0g5QSt2MVFod05ZQU9i?=
 =?utf-8?Q?1nxqbIPLMhfoOhFcw1jAVTTvPOdf44Ai?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae8dfcc-ea0b-467d-c49b-08df089d7676
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 02:54:10.2941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1454

Linux Upstream Status updated: Sep/2/2026 
@https://github.com/sophgo/linux/wiki

Linux 7.3-rc1 was released. Some patches for CV18XX family products are 
added.

New Patches:

CV18xx:
- Enable ethernet for Milk-V Duo 256M: v1 was posted but need rework.

SG2042:
- N/A.

SG2044:
- Add spifmc nodes for srd3 board: v1 was posted.

Thanks,

Chen


