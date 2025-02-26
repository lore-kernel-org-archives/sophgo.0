Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011037.outbound.protection.outlook.com [52.103.68.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB918BC3F
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 11:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568795; cv=fail; b=Z0khUUPHb/7HA7RX6tRX9TS74Qg5xoqi+LhzaCn8+n3dZjJgv4Ahrg20kgcoOD1Mw4vql8lKPNTEodu2FSp/PClpB8L5dqSpioQqLDblQWtrl59CsJoz/xyPpOrU0cMo3T/AS1j1FXVQ3YD+yElwRJsChIguCYOIaEJEwp7BL4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568795; c=relaxed/simple;
	bh=TUFbkQHThA7eliZzlVTydAaByVZkS3nf8NCLMQtFQJ4=;
	h=Message-ID:Date:Subject:References:To:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KLSrPNLmMzyX5Z4GZxoHRErkz5o5VuoxmC9NHxW79W//uAGqlASvQji+VRJlvoOap9W9cAro3SlrF3TThLgNjq5QEQB9JtZX1LnEwd6O+mE5yyTH7nKgdya/+HdbroH7+erx96XIRXK7Yv51beZaLFMXiDlThx9DlJWzGhi6NYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qqDMg2x5; arc=fail smtp.client-ip=52.103.68.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qqDMg2x5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mon/nTBROcPT2qgF5bTOrdEX1ZZA18aFVQvTQGx8S4Og6qtoCu9xiiR5gviTXCK0aLhNR5wuXgBw3RW57HZ/hnYKo8tmQ+T6s20rxXul3DF1opW02Nf/VoXTLELrxSJ+c+t3ex6dlE61O0IvNT+QuH8BIvjTODIDh5lYIX+KgjjgaNZLJRLm4HKdSX/TeVxsrUOp/5LSH55g87mnWGTHTFRv46sxtxKrkXPsXu0JYLA+fibyXz04M1kqzPh4n5faoNFngSodUQ7wSTuiMr86Ff8FfEBjAJTiOfUrHl4ARo+2iTVZ2d8RDGaUCS1WsfSKLkZgarvuFb8/GZlI6vRjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlvDxSOkri3EPWydG84IxbSpD/VKYKmwH9f2l5y6yRU=;
 b=LsKUnFhrCh820Hg68s41bNfYOotiHnlhGLkcV4qcaxEzOdza4zKw3eaDwr0rfuYgxgqrOs7ASzRYmVIZswGlMJaZTqLXehfjzvvM0fQGkIjrlicZuX37LGW65APSA8TqyRAcH42zJ7df1Hj7BuudoAuHLk97sYy724+uzQVmkXM/z7y0+pyMxqt8P84Df6ihavHAqbUiVHAgPpEfIFA7NeZo5kxA3XpvynERkbM5kW2QG6bvtLTVr5UbBXt8rNzdTF+80YYryZzw7e/gBnkcwRPk/xHof6p7Tvq6J8xqJHYZ543xp+vM/bpScn9rhIB+5jbbnGjzRVuYNFdOgA8/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlvDxSOkri3EPWydG84IxbSpD/VKYKmwH9f2l5y6yRU=;
 b=qqDMg2x553WRWyZp/FGYQPdatL6KbuV2OdyBSbMwj51XBUNe3vI6KtRd4v3ZuesBVTH42FBtLLCHrlAKnD8tkDwPyhIHRx+us2YXJmId+4mOZP4kTL8RPkRxjqM0OG8asVKJ6dvTMafXz4JFaMu49/zDBhwe+K8EVRtzM85m6ZJGBY0DmDPcHrvMEmc/SCpCtrESLNSieLJu1LqY4yT+HQhputCBdr4IS+bp8WvLpPa0Jq4HnsrtVKhwstwooRHl3WMx9w9iMZG5g6uG+4r94n9CwbtoltewupVADQhQQcumpw7x3oVcvK4eBBQQjH/tdgweAB+D6YOlUSOYl7IU/Q==
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:165::9)
 by PN2PR01MB4473.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.19; Wed, 26 Feb 2025 11:19:48 +0000
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e]) by PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e%5]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 11:19:48 +0000
Message-ID:
 <PN0PR01MB9166219A312550616793AFAFFEC22@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 26 Feb 2025 19:19:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Fwd: [tip: irq/drivers] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
References: <174055629597.10177.7222023913255243062.tip-bot2@tip-bot2>
To: Inochi Amaoto <inochiama@outlook.com>, sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <174055629597.10177.7222023913255243062.tip-bot2@tip-bot2>
X-Forwarded-Message-Id: <174055629597.10177.7222023913255243062.tip-bot2@tip-bot2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:165::9)
X-Microsoft-Original-Message-ID:
 <0c6869f5-5120-4185-b29f-5a41dd252eb0@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9166:EE_|PN2PR01MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1649f9-bdfd-4d06-b0b0-08dd56577b0e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|461199028|8060799006|19110799003|6090799003|5072599009|1602099012|10035399004|4302099013|440099028|3412199025|19111999003|41001999003|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTBKS0p4UE9hMUFXMU8xbnZNV2NqS25wK3lSYW5NalM0RnVDWGtzcGZwRlpO?=
 =?utf-8?B?SVB4S2lDeThvbmlNNGdFNHREZ2V2RkNHcmxidDBwSVV3dDZvKzhNZW1YM2pT?=
 =?utf-8?B?OGdRRlZydktmYmRCbmZqQ213dUhMMkhZekhKeFgvOGovNllMVWFLRC9TcFBn?=
 =?utf-8?B?eGdCckxpSWNUNnNmdkpwRTM0R040VU9oQkJvZTZDWFBFaXNVR1h6dFJlWGhr?=
 =?utf-8?B?bEwrTUp0T0FlYW5BT09zT0ZBdWNsTE5ReWd3UEp6TDBvTHp2SVRSUmpyUEVV?=
 =?utf-8?B?cGsraGxsL2dyOVFhRisxdzhlYkM1VEZMenZicHFXNkgwa3NiVGlFdG1LT1Rx?=
 =?utf-8?B?eTJ5c0lmNkhFMVhKeHNjMEgvWUgrNmFXV2JMVGR5dytkcWZoLzBmYzliaUhv?=
 =?utf-8?B?TS9kNENFVzM4RkxXemhTNXZ0SHB6cmt3VlU5ZzNIMnFYSWpwOURUZFcrdHJr?=
 =?utf-8?B?SEJ6bnR3SXVKUkdyTnF1bENNWFJjZVhEVU4vNXJpaWw1NFd5TGloTndiSEg5?=
 =?utf-8?B?WldVYUtFaFBWby9EeTMxUzBicmxCWERUSVd1a1pnR0NQRlZOTlVJWmQyZFAz?=
 =?utf-8?B?N0xjOC9yanFQRWQzRFZQb2JCL0JqK3lleC9FdUk3WXZRNFJiTjBJVW56QzIx?=
 =?utf-8?B?d3VjOHg2b2Vsc29QQytzckpPWDIvYUFZQlVPWW5RV0RBbEpYUDkyaDRKWU0y?=
 =?utf-8?B?UDhGeS9aZll6UEVUcWVhb0dJNnpPWDJLdTUyRUsybzMxWFBpMjNXQ1MrZnVt?=
 =?utf-8?B?UkRURDg0SVFoOS9iVFIxTEgxUHFJWlc5R2JkdnJlOVBNTTJFRk1jMmxjSVFr?=
 =?utf-8?B?NzAyMUxIMmJ5TEVad3VkcnJpc1p3cTBmd2ljcTgvekNteUJnTUx0QXV4WC8w?=
 =?utf-8?B?S3I1MjNjZ3JGR01aYm94cnNpcDQ3WVpzZmIwZWZ1REpBZ3dXM0JUbXlxR3VC?=
 =?utf-8?B?clZudnA3cFdYVFFpRWovZks3VkkvZmx2RitTVGlZY0xaWFkrNTNkUkx0ak00?=
 =?utf-8?B?M1J1VTJLSWtYMHk0dFFjU3FTS2xIVXlRd0huNmxaMkxZK3dzT1FzK1hXeFRD?=
 =?utf-8?B?N2VQNi9nd2JhZW5qQVFxUncwRk5rdWMxaG9pYlh4aHBSR05DODRQZ2tvNkZQ?=
 =?utf-8?B?bSs5Z2lMMC9SK2FjNDJzWTgzVjVOZGtFZ200MXpLTzRHTFlhV09UYUNXazZQ?=
 =?utf-8?B?blIwZExaUjc4d3R1bWlLYUhudllwOTMxcHptTVBJL1NKWGlNNHdkeVdJYjgy?=
 =?utf-8?B?NVJGeEZzT0QzZFdhTkw5MlpQd3c5WExnSjhrd0xiUFdUUCtRL1lSTm13eXNx?=
 =?utf-8?B?VTJNN3Q2c1JQY0I5K0ZZQ2R0OFNuQ2M4UWlIVTk2UnlOZ1h4WC8zMWw2M0Vj?=
 =?utf-8?B?K0RrMG96RjF6OFNOQ1lBNktRclNwTGlFcFVlL1NqQkFpak4zUW8xUG9pNXox?=
 =?utf-8?B?cktzWmc0Ykt6MHZLeEgvZWtVUVl4K001Z1QxeitCSWJKbmdqb1o5ejJ4Lzkw?=
 =?utf-8?B?bkJzSFFuTUdydXBScjhZd2VsV1dlY0ZXcEJTN2c2N1BKc2Q1ZHRTWDRwTDRG?=
 =?utf-8?B?YldDSnZTMHh6bkJ2dWlkaVladWthNmJKTGNsVlQxVVFBUnRMVGpoY0hRdVpG?=
 =?utf-8?B?NEY0b3FYbFA5bEhHb3BoZlprYktjbDFSQ0s4ME5aTUFObVJVTXNmUHB1OHFH?=
 =?utf-8?B?QXlTUzNRdnJSNDJBS2UxZUlpVmFVYnBhME1zNlQzaTBjK3VLVFh0bjVhMDN1?=
 =?utf-8?B?OEQrNTF4V0JSWUhjVkNpNEg2QXZDai9CNTFxR1hqSjE4MEEreGNaaTVReVJz?=
 =?utf-8?B?Y3padkxPeDdjdWJKczhVUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjYyWnRsSVpBa0dCcGJxQ0V4QTJyenNSMm82ZndQWEF1VWkrL1dNM0ZEaWtj?=
 =?utf-8?B?UmZONU9DcmtxaE13dXMrQ3VydWFEWUlHNkdzaktUMUJybkZIRlpIcWM0Tkhx?=
 =?utf-8?B?V0xMT0MrQ1dKbWVxMzBIR0ZWT1JiUUhlemxieWU4L0pvZkQ2aHNHbjdjS0VM?=
 =?utf-8?B?bEdoL2x2UWlRREZHamE1eCsrMjdKZTROdzFES3ZjUHFMMmNmVHdTZ1NrcUFy?=
 =?utf-8?B?ZjRZUDNhajlNWHBTU1VxTnRob1MzVlhhRWN0TFhBeWpYUGpTZDdoMzlMNEJ6?=
 =?utf-8?B?TXhnOWJGUm1ha1YrSHQ0YzFzSEhJVTBJYkVXbGVHWWFHZ1Zka0JGajFKS0RL?=
 =?utf-8?B?R05BZHRtMTZSb3RiLzdQWTN6WjNTbC9lVXcyWUt4Y3V2ZWYrL0FTVWE0NUFI?=
 =?utf-8?B?NEhGM1p2ZGZkSWR5eGNtWTVRcEJDTzlLQkgxakpwNWpFWlpQS0g2MHAyNHI1?=
 =?utf-8?B?M0FZcnBGMisvS2sxRkRMYTArdkg4TlU0V3ZtVElyNWdUbk1yT1FoT3FmNVZp?=
 =?utf-8?B?NFpmdDZPN09RV1ZERitFa1VzU3U2Rk5RRlpwSTFLK2FoU1dxNDhuK2gvT28r?=
 =?utf-8?B?SmpUTXRKNkNtUDR6bU5Jd0xxUXlSbkNkb3ZVK2RxZ05GOSt6Ym1xQlVsOEpS?=
 =?utf-8?B?WWdraXJ6eHNqMDBJTy9tNU1mM1lFbTAreWI2NFo2S3I1VGZVQlYzM21TMjNT?=
 =?utf-8?B?SnR3ZTg3UE5KTEM0VWZCVWZqbEplYzh4c1JjWWlGY2I0MzV2MllqQXBUbkxY?=
 =?utf-8?B?M2cybmxMdG5rK1RXU0pkK3d6UHR1Tm1YbzFLL1lMMmVsbmVNRmptcEJocGQ1?=
 =?utf-8?B?dE1Hb092MUI5QU43S3IxUHlDR08zbE44ZzluWDVrS2dSTTcycTMxN2lEMktL?=
 =?utf-8?B?b3ptSFdsaTg4VkU3VXhhUzBjaVplcDlwREUyMmJidWVySnZnNDFCd2tjalNX?=
 =?utf-8?B?ZGp5VjVCN1VWdmo1SVdLbUVzL2JKSUs0RVlTSTdwMGFxR1AyM1NZc0I3SDda?=
 =?utf-8?B?bjQ3Q0krSks2Y0ljeFpCcU1JdVlKUU1JUkVKWkpWMGorOERwWktTUFN5ZEEz?=
 =?utf-8?B?N0ZyRFc0QjNSYk5kUnNXaHkwQk1rd0xmbHJ5R09PaEFUcUhNZnJRQzRBa2c0?=
 =?utf-8?B?eVJTR2xXVnFHNlo5aFJWNi9zNU43eGo3RVV6SWlvRFhCS2cvRWw5WmxDOVVR?=
 =?utf-8?B?MGgzUmRWa1FyVGJRdkpZTGZPeDM1enptZ1hyamc4OTlIbEJ5eHNjYUd2MzE2?=
 =?utf-8?B?aXM5K2pQbmJUTlVjVllrWkl1bDVPZ00rby9TY3k5RFdPQVd2UEJFWUdHQnhj?=
 =?utf-8?B?R2dtNUd6Mko3cTBYakR2elE0a2I5and0bE9yRC9YRjhHWlJvRmdDc2VkeStp?=
 =?utf-8?B?Z0I4MG91OUtDeXJCbmNjbGlqWHZqejUwYStUdGUxR3E0blFCSm1oOGpFWnpx?=
 =?utf-8?B?ZHkramcyS2ZsVi9jem1SUzZwdTRMYmp6V3pKU2Y1WW4wQVJSUWZxVHZ1QnZ0?=
 =?utf-8?B?dnRzckhjb3VrSzgyeHhJWFpiY1JnWGVkOWhBOVlmUjl2NTBnU1d6MFNzUG1w?=
 =?utf-8?B?Q2x5ZVRFNjdOWEpvRkxvVk80YVM2TVNpR3FuSW5iTmN5ekxzMjgwTU9xMG12?=
 =?utf-8?B?RnZwUmNDUHFVQ1FLRXlHZWRiejR0NE91QU1nRk9tOFVKZWFPVGlNSys5RVQz?=
 =?utf-8?B?YWhZdUhUNW1EZWF4ZXJXUENJNmg5c1VZOUFDdDRDb3lkSnVpWUZrNlVFMGFF?=
 =?utf-8?Q?hcERmU8J+bKdaVoNgNzCYTzuDOd+Cp8+D8MFWOa?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1649f9-bdfd-4d06-b0b0-08dd56577b0e
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 11:19:48.6341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4473

FYI, I hope it would be in v6.15.

-------- Forwarded Message --------
Subject: 	[tip: irq/drivers] irqchip: Add the Sophgo SG2042 MSI 
interrupt controller
Date: 	Wed, 26 Feb 2025 07:51:35 -0000
From: 	tip-bot2 for Chen Wang <tip-bot2@linutronix.de>
Reply-To: 	linux-kernel@vger.kernel.org
To: 	linux-tip-commits@vger.kernel.org
CC: 	Chen Wang <unicorn_wang@outlook.com>, Thomas Gleixner 
<tglx@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, 
x86@kernel.org, linux-kernel@vger.kernel.org



The following commit has been merged into the irq/drivers branch of tip:

Commit-ID: c66741549424ca67453885f8b3a5aa81d9abfb34
Gitweb: https://git.kernel.org/tip/c66741549424ca67453885f8b3a5aa81d9abfb34
Author: Chen Wang <unicorn_wang@outlook.com>
AuthorDate: Wed, 26 Feb 2025 10:15:19 +08:00
Committer: Thomas Gleixner <tglx@linutronix.de>
CommitterDate: Wed, 26 Feb 2025 08:41:28 +01:00

irqchip: Add the Sophgo SG2042 MSI interrupt controller

Add driver for Sophgo SG2042 MSI interrupt controller.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Link: 
https://lore.kernel.org/all/3104216ca90a5f532bafb676c1c5b1efb19e94d1.1740535748.git.unicorn_wang@outlook.com

---
drivers/irqchip/Kconfig | 12 +-
drivers/irqchip/Makefile | 1 +-
drivers/irqchip/irq-sg2042-msi.c | 249 ++++++++++++++++++++++++++++++-
3 files changed, 262 insertions(+)
create mode 100644 drivers/irqchip/irq-sg2042-msi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index bc3f12a..441f107 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -745,6 +745,18 @@ config MCHP_EIC
help
Support for Microchip External Interrupt Controller.
+config SOPHGO_SG2042_MSI
+ bool "Sophgo SG2042 MSI Controller"
+ depends on ARCH_SOPHGO || COMPILE_TEST
+ depends on PCI
+ select IRQ_DOMAIN_HIERARCHY
+ select IRQ_MSI_LIB
+ select PCI_MSI
+ help
+ Support for the Sophgo SG2042 MSI Controller.
+ This on-chip interrupt controller enables MSI sources to be
+ routed to the primary PLIC controller on SoC.
+
config SUNPLUS_SP7021_INTC
bool "Sunplus SP7021 interrupt controller" if COMPILE_TEST
default SOC_SP7021
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 25e9ad2..dd60e59 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -128,4 +128,5 @@ obj-$(CONFIG_WPCM450_AIC) += irq-wpcm450-aic.o
obj-$(CONFIG_IRQ_IDT3243X) += irq-idt3243x.o
obj-$(CONFIG_APPLE_AIC) += irq-apple-aic.o
obj-$(CONFIG_MCHP_EIC) += irq-mchp-eic.o
+obj-$(CONFIG_SOPHGO_SG2042_MSI) += irq-sg2042-msi.o
obj-$(CONFIG_SUNPLUS_SP7021_INTC) += irq-sp7021-intc.o
diff --git a/drivers/irqchip/irq-sg2042-msi.c 
b/drivers/irqchip/irq-sg2042-msi.c
new file mode 100644
index 0000000..ee682e8
--- /dev/null
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SG2042 MSI Controller
+ *
+ * Copyright (C) 2024 Sophgo Technology Inc.
+ * Copyright (C) 2024 Chen Wang <unicorn_wang@outlook.com>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+#include "irq-msi-lib.h"
+
+#define SG2042_MAX_MSI_VECTOR 32
+
+struct sg2042_msi_chipdata {
+ void __iomem *reg_clr; // clear reg, see TRM, 10.1.33, GP_INTR0_CLR
+
+ phys_addr_t doorbell_addr; // see TRM, 10.1.32, GP_INTR0_SET
+
+ u32 irq_first; // The vector number that MSIs starts
+ u32 num_irqs; // The number of vectors for MSIs
+
+ DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
+ struct mutex msi_map_lock; // lock for msi_map
+};
+
+static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, 
int num_req)
+{
+ int first;
+
+ guard(mutex)(&data->msi_map_lock);
+ first = bitmap_find_free_region(data->msi_map, data->num_irqs,
+ get_count_order(num_req));
+ return first >= 0 ? first : -ENOSPC;
+}
+
+static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data, int 
hwirq, int num_req)
+{
+ guard(mutex)(&data->msi_map_lock);
+ bitmap_release_region(data->msi_map, hwirq, get_count_order(num_req));
+}
+
+static void sg2042_msi_irq_ack(struct irq_data *d)
+{
+ struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+ int bit_off = d->hwirq;
+
+ writel(1 << bit_off, data->reg_clr);
+
+ irq_chip_ack_parent(d);
+}
+
+static void sg2042_msi_irq_compose_msi_msg(struct irq_data *d, struct 
msi_msg *msg)
+{
+ struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+
+ msg->address_hi = upper_32_bits(data->doorbell_addr);
+ msg->address_lo = lower_32_bits(data->doorbell_addr);
+ msg->data = 1 << d->hwirq;
+}
+
+static const struct irq_chip sg2042_msi_middle_irq_chip = {
+ .name = "SG2042 MSI",
+ .irq_ack = sg2042_msi_irq_ack,
+ .irq_mask = irq_chip_mask_parent,
+ .irq_unmask = irq_chip_unmask_parent,
+#ifdef CONFIG_SMP
+ .irq_set_affinity = irq_chip_set_affinity_parent,
+#endif
+ .irq_compose_msi_msg = sg2042_msi_irq_compose_msi_msg,
+};
+
+static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain, 
unsigned int virq, int hwirq)
+{
+ struct sg2042_msi_chipdata *data = domain->host_data;
+ struct irq_fwspec fwspec;
+ struct irq_data *d;
+ int ret;
+
+ fwspec.fwnode = domain->parent->fwnode;
+ fwspec.param_count = 2;
+ fwspec.param[0] = data->irq_first + hwirq;
+ fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+
+ ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
+ if (ret)
+ return ret;
+
+ d = irq_domain_get_irq_data(domain->parent, virq);
+ return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
+}
+
+static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain, 
unsigned int virq,
+ unsigned int nr_irqs, void *args)
+{
+ struct sg2042_msi_chipdata *data = domain->host_data;
+ int hwirq, err, i;
+
+ hwirq = sg2042_msi_allocate_hwirq(data, nr_irqs);
+ if (hwirq < 0)
+ return hwirq;
+
+ for (i = 0; i < nr_irqs; i++) {
+ err = sg2042_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
+ if (err)
+ goto err_hwirq;
+
+ irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+ &sg2042_msi_middle_irq_chip, data);
+ }
+
+ return 0;
+
+err_hwirq:
+ sg2042_msi_free_hwirq(data, hwirq, nr_irqs);
+ irq_domain_free_irqs_parent(domain, virq, i);
+
+ return err;
+}
+
+static void sg2042_msi_middle_domain_free(struct irq_domain *domain, 
unsigned int virq,
+ unsigned int nr_irqs)
+{
+ struct irq_data *d = irq_domain_get_irq_data(domain, virq);
+ struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+
+ irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+ sg2042_msi_free_hwirq(data, d->hwirq, nr_irqs);
+}
+
+static const struct irq_domain_ops sg2042_msi_middle_domain_ops = {
+ .alloc = sg2042_msi_middle_domain_alloc,
+ .free = sg2042_msi_middle_domain_free,
+ .select = msi_lib_irq_domain_select,
+};
+
+#define SG2042_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS | \
+ MSI_FLAG_USE_DEF_CHIP_OPS)
+
+#define SG2042_MSI_FLAGS_SUPPORTED MSI_GENERIC_FLAGS_MASK
+
+static const struct msi_parent_ops sg2042_msi_parent_ops = {
+ .required_flags = SG2042_MSI_FLAGS_REQUIRED,
+ .supported_flags = SG2042_MSI_FLAGS_SUPPORTED,
+ .bus_select_mask = MATCH_PCI_MSI,
+ .bus_select_token = DOMAIN_BUS_NEXUS,
+ .prefix = "SG2042-",
+ .init_dev_msi_info = msi_lib_init_dev_msi_info,
+};
+
+static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
+ struct irq_domain *plic_domain, struct device *dev)
+{
+ struct fwnode_handle *fwnode = dev_fwnode(dev);
+ struct irq_domain *middle_domain;
+
+ middle_domain = irq_domain_create_hierarchy(plic_domain, 0, 
data->num_irqs, fwnode,
+ &sg2042_msi_middle_domain_ops, data);
+ if (!middle_domain) {
+ pr_err("Failed to create the MSI middle domain\n");
+ return -ENOMEM;
+ }
+
+ irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
+
+ middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
+ middle_domain->msi_parent_ops = &sg2042_msi_parent_ops;
+
+ return 0;
+}
+
+static int sg2042_msi_probe(struct platform_device *pdev)
+{
+ struct fwnode_reference_args args = { };
+ struct sg2042_msi_chipdata *data;
+ struct device *dev = &pdev->dev;
+ struct irq_domain *plic_domain;
+ struct resource *res;
+ int ret;
+
+ data = devm_kzalloc(dev, sizeof(struct sg2042_msi_chipdata), GFP_KERNEL);
+ if (!data)
+ return -ENOMEM;
+
+ data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
+ if (IS_ERR(data->reg_clr)) {
+ dev_err(dev, "Failed to map clear register\n");
+ return PTR_ERR(data->reg_clr);
+ }
+
+ res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "doorbell");
+ if (!res) {
+ dev_err(dev, "Failed get resource from set\n");
+ return -EINVAL;
+ }
+ data->doorbell_addr = res->start;
+
+ ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
+ "#interrupt-cells", 0, 0, &args);
+ if (ret) {
+ dev_err(dev, "Unable to parse MSI vec base\n");
+ return ret;
+ }
+ fwnode_handle_put(args.fwnode);
+
+ ret = fwnode_property_get_reference_args(dev_fwnode(dev), 
"msi-ranges", NULL,
+ args.nargs + 1, 0, &args);
+ if (ret) {
+ dev_err(dev, "Unable to parse MSI vec number\n");
+ return ret;
+ }
+
+ plic_domain = irq_find_matching_fwnode(args.fwnode, DOMAIN_BUS_ANY);
+ fwnode_handle_put(args.fwnode);
+ if (!plic_domain) {
+ pr_err("Failed to find the PLIC domain\n");
+ return -ENXIO;
+ }
+
+ data->irq_first = (u32)args.args[0];
+ data->num_irqs = (u32)args.args[args.nargs - 1];
+
+ mutex_init(&data->msi_map_lock);
+
+ return sg2042_msi_init_domains(data, plic_domain, dev);
+}
+
+static const struct of_device_id sg2042_msi_of_match[] = {
+ { .compatible = "sophgo,sg2042-msi" },
+ { }
+};
+
+static struct platform_driver sg2042_msi_driver = {
+ .driver = {
+ .name = "sg2042-msi",
+ .of_match_table = sg2042_msi_of_match,
+ },
+ .probe = sg2042_msi_probe,
+};
+builtin_platform_driver(sg2042_msi_driver);
