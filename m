Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011025.outbound.protection.outlook.com [52.103.68.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE718BC3F
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 11:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568826; cv=fail; b=nWYUqqkEj29IJviKTYDyfahsal3apyx+zWS36c2nzl7co1lJ1vnhyufwHn5bUzjci42lSMypdwtfmrEYlfbk+0nEAzfrG8a+DOurCnRARYM1+l2202c+dPOUiRcQep3qxGLQWOwKa7oipy4FyUgCst3QuLWaWvaye0Tg1CLkYcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568826; c=relaxed/simple;
	bh=0jcN589Xar7IthgcLHoZf6Kv78Sy+DbHhqdEBmaRwJc=;
	h=Message-ID:Date:Subject:References:To:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WkrwpI8VQnOGP8xly0/YMCXg+fMUfKxp/kdmvgdghiJ8wkctC1h+Wqe8PPht+t5GzwzPM/bY/3KtM1xXp3+LvKTTzGEhu5QCUQ9MNwpcM8V2+f4Ix6YyJmLOMZVA8OJtENgkQFzclwtYtuGRssA+u8HBtS+bUCcVpnCCkQPjZGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=N0gVEPky; arc=fail smtp.client-ip=52.103.68.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="N0gVEPky"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZE5JTs+OQtElTFRM2waUWofCbWHiXvLbQzx5uJ/QxyCJohIliNbAK51chh2jjVVvvEIi+/gJAqC1VZPWJ9UewLl4WUX8T/FDQnCNg/O7m7sScnbo8ViKD7w8NHTwRxSqD/hMnXZEQaH8O+IXMG8tqsxWt/drYB1aJhQ03e4X1Son8m1Sz50zINtK8L+NKdnWaekBko2G1l+t3BHR8O/mvGjXaIKpvI/NFjS3VbchKKJt4GFej6sP+nP+jmAepvihv9BUKh5OE8et7+tiOQH38L2vMlgMJ82AuuDTVefELVJpEb4aGX+nsNSXN70fh7YJltBrZJIFlQ44czjFuUwbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZoCWcw9pdX8/5eVkRsW3oO/yCquqqBFK+Q2EClZMnk=;
 b=Gee50lcZl6OL47jJi1/Ml3SZwCBMkVva264r+BAtwDdp8c5dOyPzS9sZg4XHWsFEY8jVZ5ha3hkDSlVzft3+1/q7C4FUMFT2GSMGtqb7OBc0vdlRtBr70fw3nnHwjElKyGSvWrp6YNHjRk6gwzVoKAdUenORc8z5yEII9alZP1uuPrlz0SihzTcpxMGDADRbFs++E8WvrG1SsAa0W/I3PzaxnnJQphAvsuhiiiyU8FY1X5xCfIw0MqED95mzVgQS/UTt1ojRNhZQp+bQsj/QuWu9pTrRf2aIoOLz6jbGPlrtJPHq3c/1mWGl1uUf51Xtb6DztYN0EUzv4viaJKpP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZoCWcw9pdX8/5eVkRsW3oO/yCquqqBFK+Q2EClZMnk=;
 b=N0gVEPkyDwswzXCWtPkhXDvTHlX+zfoJ6d6hJ8+7CV8UmNJX0q/tvVGbdq/Z08rQui1xuBFvnMCi8T7wW7KNUnN1ZlSzJV8Kk3h0GV1l8iHRMnvD6JMRw14fbQ9xJA5KQLuX0Yf4gWu597EQtdwW2H/7Dlq7btQw3d1mdudHeLn/JBnJTUhuZVJeNQw2pln7lbFQxdqDx7VDfElYSuGOSd4WNVh0y1ZnYNpnwABJmXJoPqALMEMe9YAQc1kvggqGhZ0jAhBWFJaybFSLKtLl1PVmF8+5dUKJQasTJhvs/B3V+RQLQoWa3U/qtld8/Vz+ubuPWRm0kL6ApaWk+cdb/A==
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:165::9)
 by PN2PR01MB4473.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.19; Wed, 26 Feb 2025 11:20:20 +0000
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e]) by PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e%5]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 11:20:20 +0000
Message-ID:
 <PN0PR01MB9166DD7505D7CD112396A9D1FEC22@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 26 Feb 2025 19:20:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Fwd: [tip: irq/drivers] riscv: sophgo: dts: Add msi controller for
 SG2042
References: <174055629167.10177.2318536825336903930.tip-bot2@tip-bot2>
To: Inochi Amaoto <inochiama@outlook.com>, sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <174055629167.10177.2318536825336903930.tip-bot2@tip-bot2>
X-Forwarded-Message-Id: <174055629167.10177.2318536825336903930.tip-bot2@tip-bot2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:165::9)
X-Microsoft-Original-Message-ID:
 <6985fb6f-07ed-48ec-9556-0a8e2a6e0a3b@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9166:EE_|PN2PR01MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f17bd96-b0c5-4f0a-236e-08dd56578e06
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|461199028|8060799006|19110799003|6090799003|5072599009|1602099012|10035399004|4302099013|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YldWYWl1L2tFUlFkNHpzM2NUM2RJYWJjWnZJR1poSDNWTkxweWxDUEdyQ0RV?=
 =?utf-8?B?NlowWEVQL2ZHWEFJWEc3OTR4YUhuUFVhaHY2UG05OXdKa0dLanluY1NLL1Uw?=
 =?utf-8?B?WHN1T1lyY25peE5jQmJSdkh3WkY5ZjJUbjM5ZzhsMmRZckQ4MEFDTFlESk0v?=
 =?utf-8?B?WFllaDJkbjBWTTRTejlIRndKYmRqNGtLSGUzYmpGRVRCakkyWUJNci9pdy9W?=
 =?utf-8?B?YVE0M3VpNS9HRyt2bFMweDc4NWsxbFhiazFVZUdNUHI3ZWZGRWxJZTVFZndW?=
 =?utf-8?B?RUlaL01uTUlRSU9FdVVsRTJDTGpzc0EyZklUeGlxZlZLbFdYRWI2TkVuaHdh?=
 =?utf-8?B?b1VmZHB4TDBCU05tQWxuTzNkNWExeDZacHNZanlFTFk1SE9hdTNzUEVzd3lr?=
 =?utf-8?B?RGh6dFI3NlpCWHNCdHJYNzQ4SjJlYlJVYjB5eDI1UFdNbVpBQ3doNEt5VGZm?=
 =?utf-8?B?VzJReFN2bkI5Mk05ZFZ5ZkEvWHdoY0ZRbzlhbkI2cWg2b2s3VkVIUXorOE9S?=
 =?utf-8?B?SDc5djc2eVoxNlJLTUl4UlRYSys1M1VpazU2WnJrNkcrNDQyalFmRHlhbjJV?=
 =?utf-8?B?dE5ST0tEM3M0L0E2RXFLMzlmYVJPdlg5bFF0L1U4Tmg1RlUvbGtLc3ZjNHF6?=
 =?utf-8?B?MjhKNm9xdEFueHRKcGVVZzNjZmppN25KbnRlL2dCNnZjd0Y5YUNxMmZZaUUw?=
 =?utf-8?B?cTRtR0ZtMmU5NnFtaWMvRzA2WHd0OVI4cGd2ZHZOb3k2VlZKSWRlSlBSSnVv?=
 =?utf-8?B?ZHVHYkxIQ0w4S2dxRytneDVBKzg0bzRUejc0Q2t4U1o1dUo2QStzcWoxZkMr?=
 =?utf-8?B?b2JwdG9UWVBOUmVlN3hCODJNanpMNUhxTkF4OUxZOGp1c1J6Sng4aW0xeXhI?=
 =?utf-8?B?dEZtekF0WU9nM1NaWGJwTnVRclEzKzZZMHlwWFJucHBFaHphMWg1d3JLdDcv?=
 =?utf-8?B?OTZhRUtIOVdEbXhIanN1aVZ5VndENU9mTXdXUitwOWFqM2ZNc1Y0dTUwQmUw?=
 =?utf-8?B?bTZqbk5uY2hWZXJtcjNKbVlDVUtoZTJxZG4zdVdlelR5U3dkUjdOZS81emtk?=
 =?utf-8?B?TXdzWTJvSENaTGxpSDBac1l0TDR1MzZWdkh0cnJ1dURGTnhEZG1jaXJlQ2ZX?=
 =?utf-8?B?STVNY2FkWHZ5NHhkWmN6dmhjSjV2U09nVmo1ZVdmYTBJeGwxL2FrTUkyQjRQ?=
 =?utf-8?B?VVZ4Ui85bXkwUjE0TE9TTGpIWE9NUDhqc1FBM0NhWXkySzV4d1d6am56Y2hs?=
 =?utf-8?B?R3RWNkcxcVFaYzJMZnhaYXFxbmQzeFB3eUlxcEJQdm1hc0U3Qi9ZVys4ZnFv?=
 =?utf-8?B?NHNDTnRxUjhYVFhPUGNnTE1vdmdSL1h4Q3lsVmpSUVBrRzNIK1FlWHpmbTRG?=
 =?utf-8?B?dG1PY01SS0tuN0p4ampZV0JpUk10ZmRxUGR6cXhSVlpDU0djemVqOXJEeTNP?=
 =?utf-8?B?d2toQzZNVEtGclpLT2FUaEVZOHJjOCtvV2NoRTZORXhtbEJCNm10SFNQZFZs?=
 =?utf-8?B?Qlh6U2xINXEvQjJsaG1QUnJsVjRjQjBBNDdtbDh5ZG14b2VQbFFJUkZVQWht?=
 =?utf-8?B?blVoMVNkTmk2VWx3KzRvOHJLZEtGaTFIZ081eElIOXNLSC9KY3ZUanhBWVUw?=
 =?utf-8?Q?yiEcmeFQWDkxtq5cnwEBFnTVa064y5eIXgH/PxT4jOYM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3NBRUFEOVFhTUs5Z1NwTVN5bm4xUkRJY2F4N3Y4MzVBQ3JQbUxob1gxN3E1?=
 =?utf-8?B?bzFXTHNMU2dFMkVoeE1Od2EyQ3RlSjRwdC9YS05FYTZPdk0wZHNHYVlWbzdQ?=
 =?utf-8?B?UThYZ1BqUmJGa0ZlZndCMTNyNkF3RzB6VzRYSVZOZUlFWWxiTHliajJDazV2?=
 =?utf-8?B?MXlBTFU5UmVrZ1pvU1ZzOVNpUStTMUtDOHdCbGlDRTRHbVJRTDBtbS9FcE82?=
 =?utf-8?B?cTI4N3NWd1k1NWd1NkRPRVllWmQzMU1wWnlwVXBvTFNsazlJZE9LZHJkSnJ3?=
 =?utf-8?B?ckpXWlhmbEx5V0ZCcitzSmxTNGs1c3Fldjk4WUJzbVlNK0JlT3ZuU0xZa2s0?=
 =?utf-8?B?Q2xyVXlvRnZjTithSW5pVHAzZ2NvMnNFSFdpNC9hNGQyMFBNejg2MmREcTZE?=
 =?utf-8?B?a3NsVjRFNzZMTmNYUGRvcHdKZXpHeXJUcC9PTTBaWHBLMDFMT0RXZ2g2bFRL?=
 =?utf-8?B?V2dEdVpHamZmOE9rNXhyYWNoU3VrY1hRVHZUaExKYjY1bFFRQW94dFhkeTZP?=
 =?utf-8?B?bklzYjJXa0grcXlpdFR6a3J3OU9WMzl2RXM4d2FmZjZoSXl0UHJ2d1g0K0Jx?=
 =?utf-8?B?Y3FJS1ZuRHRGcXYrZ0FGSlhSbHQ4ak5obmJaU1JacTVtM0dPWjFxam90dHNS?=
 =?utf-8?B?UW9xaXJ1Ykx2bWMxMWdSdkpXNlh4QTlXTGM4V2R1MjZTY3d2eTdsQldtNU5o?=
 =?utf-8?B?cENhbmJxOEpvMnhtWHIwcE9iaVpyVGg3QTNxSkluTG1acGVsbFVaYWpMUjVj?=
 =?utf-8?B?eUVzUlFubG9XQ05SSXdwWFR6TFMzUURZMUZ2R2dGR0FrZW1aWitCaEJGRjl0?=
 =?utf-8?B?aW9wZVBNTE5Sd0dmdjFTMGtjTldTSENjekwrb1ZIODVlTERPU1F5b0ZsaGFu?=
 =?utf-8?B?MWhhOFhUbEw3NDVyV0NsNWFFdGU5QlJKMHJjbzU1N3pzRi9mOGk5clE4SXR6?=
 =?utf-8?B?KytMVGgyYnZIbEJkTGd0MlZPT0YvRmpKU1IzK3dxUWJrUmZjYnlJV3pTRy9B?=
 =?utf-8?B?M2xlcGFyZ0pFZm9hdGdxWElVTFh6eVFDcS9qY1h0VFlaOTVyWmVIRkx6VEp2?=
 =?utf-8?B?VG1lY0ZCRkxMR09xYUVpYXMzOTFSL1JDcXhyTEdpSWZDSFdlWG5zejV4dHB5?=
 =?utf-8?B?UkduZ2wxSFNuS2lvbzBZK1ZuS0RmK2hYV2RreWYySmZKYUwycjYrWWorWG9L?=
 =?utf-8?B?NEpJSlpaR1lMM2ljbVVKZXdOQXRCejRVQWdPNXBxcXdkRUpQSVB2Znh3UURo?=
 =?utf-8?B?WkQwYTlkN0trTTA4cnhYalU5ZTk5NmJaeElWWVdEdkdjbjJqU2pJN3p3a3VB?=
 =?utf-8?B?V01RSitHeTY2Nk1wb29vUnFLY0g5N1BHQWlDNExzalZ0U3B4ZjIwbUlzanRZ?=
 =?utf-8?B?MHhWcXVLdzBiSzFTRDVJcWR4SnlaZ1NXN3ZNcXU5VGQwU1FoWGxkcW1ldWg1?=
 =?utf-8?B?SGg5RXloMERyUHRDc29xY2NVK1NVdGNpYWFXY0JQV2tCV1QrdmhQZ2VsOVFN?=
 =?utf-8?B?akl1dGNxVVV5bnNCUFNoWmhBV3UrUjQwYzhvemtFNHg0V1FoWDJ6UXRSeXo0?=
 =?utf-8?B?WEFyNmlzS3RsK3ArVGFPWm9XVE8weHEvSHZKTzRrY3RNQlJiQndvM1ZjNUd1?=
 =?utf-8?B?OUt4cTZFYmdORmI2NkRLbHlwb3RsSzRWWHRKNjVjczNrYitVRHdsN1k0S0k0?=
 =?utf-8?B?NG50TVhPVHROenZLcEdoam9Vb29lUmxJZ2txclpQb0xaMENhWEo2ZUE2bnp6?=
 =?utf-8?Q?tHAyx8OhXiuSM+mIp53kgJdX3zhRNerV0i334om?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f17bd96-b0c5-4f0a-236e-08dd56578e06
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 11:20:20.4159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4473

FYI, I hope it would be in v6.15.

-------- Forwarded Message --------
Subject: 	[tip: irq/drivers] riscv: sophgo: dts: Add msi controller for 
SG2042
Date: 	Wed, 26 Feb 2025 07:51:31 -0000
From: 	tip-bot2 for Chen Wang <tip-bot2@linutronix.de>
Reply-To: 	linux-kernel@vger.kernel.org
To: 	linux-tip-commits@vger.kernel.org
CC: 	Chen Wang <unicorn_wang@outlook.com>, Thomas Gleixner 
<tglx@linutronix.de>, x86@kernel.org, linux-kernel@vger.kernel.org



The following commit has been merged into the irq/drivers branch of tip:

Commit-ID: 0edaa4593efe9377b4536211f9bc3812e3e53315
Gitweb: https://git.kernel.org/tip/0edaa4593efe9377b4536211f9bc3812e3e53315
Author: Chen Wang <unicorn_wang@outlook.com>
AuthorDate: Wed, 26 Feb 2025 10:15:37 +08:00
Committer: Thomas Gleixner <tglx@linutronix.de>
CommitterDate: Wed, 26 Feb 2025 08:41:28 +01:00

riscv: sophgo: dts: Add msi controller for SG2042

Add msi-controller node to dts for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: 
https://lore.kernel.org/all/f47c6c3f0309a543d495cb088d6c8c5750bb5647.1740535748.git.unicorn_wang@outlook.com

---
arch/riscv/boot/dts/sophgo/sg2042.dtsi | 10 ++++++++++
1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi 
b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51..fef2a0e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -173,6 +173,16 @@
#clock-cells = <1>;
};
+ msi: msi-controller@7030010304 {
+ compatible = "sophgo,sg2042-msi";
+ reg = <0x70 0x30010304 0x0 0x4>,
+ <0x70 0x30010300 0x0 0x4>;
+ reg-names = "clr", "doorbell";
+ msi-controller;
+ #msi-cells = <0>;
+ msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+ };
+
rpgate: clock-controller@7030010368 {
compatible = "sophgo,sg2042-rpgate";
reg = <0x70 0x30010368 0x0 0x98>;
