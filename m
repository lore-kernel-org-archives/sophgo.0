Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010011.outbound.protection.outlook.com [52.103.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6484C21129E
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568768; cv=fail; b=idvMkuFi4V+LB1rRLdiO55oFfblLrv3NG6Iyx81KfOOz6AiKhITHjvwdbjzXstsyUZnTcStRolIw6s81tm2DlBqduXDMLohcuZa10swWyTR7ixzBv/zQ+7E30IlhYBwlqPkdv6OZ1J6YdheZP2A0zGiVQqkRKzDOQsZG1ihvxrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568768; c=relaxed/simple;
	bh=w3X6ZpOCQcad2fVBJ8kieyR6HSLgR+oByjwLBi0Jywo=;
	h=Message-ID:Date:Subject:References:To:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rdwM+rWfemvuxHPBVO8B8j7ITYW16Yu4H+o1wrpucBcZSXh7W5G4Gsp55kp4oXSEyCEpifYZ7EpEKt4wGwDGt3yZAnlSMvErQGAhK8gH1H1RjYZeXl548dIHUlN2KJkzL+ACF+0bA1KW+TNrzUbmxc2S+DwkLPiRG9/5LqVGk6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Ooma7YBJ; arc=fail smtp.client-ip=52.103.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Ooma7YBJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NI/VE8s1XEubzknsnZrdYJ0+SoKDbEyne8qAYFtCCGjbcSJfO79G8bnq+VhxJ1fcHFa6wQfBeZ2JtaK2qiWv32Mllfv9MarSDQFzML5TSlQZEx4ABCWZ+1P5em2QZmUVItjpFrXBhPP/6OEa26W5z4GBQRZtr5Dy127IIx43LiDMx2mHBs+5zGajnqE1d1FEl70q5ui9KblE15wslK17S97eXqhnO0ZH/YkRgwfOIftWLcQoSPY8Eoy/+sM2wJn0ZHLC45K0D2+rn/INlAIVSVSQbBZJVNhSd0ZRQHadiBpZ8/iZ/8VSGzhjfK1/HMCyUpOm9ZmMrnNWWpNCugw8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KwADU8nmpXVpT4s9U4sEqK0i3gByXEHWKgIsye7Vus=;
 b=Iw8+dGaMKvd2QJmMQznudA0RA+fIYPJ6QUscLLcraGzidvFTQrHqdRIdtpFvdEuXvO9WKLyAix7QWKCGp/aXD1EQkobEfpjotfI89dFV3vLMEFDCdHt2hv+4h97qev9k8Xv76fiVMxGxzr0zH1CXUgnrFFl6lANn0RXuOTzoabyZBk2M4PFSpawS2ky1+pi1RzDmTNffa+zI7XnmVyBu9FJsYOGT22Ly8axL0qJPfbHZNqO4MqxDk1KPUKA/z3NqVPtXTyzNxYE+ASa/8nKltaIWwBLmQ9Q3KAAcdDz+ywnbvdLmomdn6s56DpkY2Q7s2rkxajXVrWSqjg2aFlHUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KwADU8nmpXVpT4s9U4sEqK0i3gByXEHWKgIsye7Vus=;
 b=Ooma7YBJAGWWDdKlsc9lbvktJSwjYR+1cZ51k3AIF/QXIO1cQZ4gbMBp6AGiB+pOOQlm+OvOejqLzDJKyV505mFS4hRgyeOFGfoCkYs3e9ksO6s9Q4sEUy/RyTygxdAN3rzFt7jXgWUrghRU8Wz7pVLBsHSRK2tKT0NvoOcb9BESEI1yLoBjAkHKCoIEw4ffB3lFy3mTOVsmAN2IA36p1N2CRKbsnjQxcOXbG/c9G2+lAepw2tgvXR56MobIxczSRY7lm9S1yELQ7aYd90m7tLw9uHiSRGs3rzxWQ0lA2f+Qj+ZUCjPtCxLWUrYYnMEx1wI4Kqm2CvkVLN9ORyhGzA==
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:165::9)
 by PN3PPFF14A1AEC4.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::5e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 11:19:21 +0000
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e]) by PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e%5]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 11:19:21 +0000
Message-ID:
 <PN0PR01MB9166937AFAD117004A355FAEFEC22@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 26 Feb 2025 19:19:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Fwd: [tip: irq/drivers] dt-bindings: interrupt-controller: Add Sophgo
 SG2042 MSI
References: <174055629685.10177.15134432668069964917.tip-bot2@tip-bot2>
To: Inochi Amaoto <inochiama@outlook.com>, sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <174055629685.10177.15134432668069964917.tip-bot2@tip-bot2>
X-Forwarded-Message-Id: <174055629685.10177.15134432668069964917.tip-bot2@tip-bot2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:165::9)
X-Microsoft-Original-Message-ID:
 <43c3e38d-2453-4a68-a2ab-a3379c0076ea@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9166:EE_|PN3PPFF14A1AEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: 50715b34-c187-4697-c17f-08dd5657696c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|15080799006|8060799006|7092599003|8022599003|19110799003|5072599009|4302099013|10035399004|440099028|3412199025|41001999003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1UwWENsK0lwczRWZVdsSk9nZzFScjNkSjhxZUJTYnZ3TUF6YmZzSmoxaE45?=
 =?utf-8?B?Ly9ncGJuK2FvdDRYSldTbk96YVdlMFplOGducm94bXhiL1MvT0hUY2tTMEhH?=
 =?utf-8?B?djhUNjdPSlhnLzJoeGNEeG9ZT3BoZFRDa083SnBMYkRDekhvWlV1QU5TRU45?=
 =?utf-8?B?WENRRUMzTlY4TUxoWHRIQ0s1b1JSdlIwTlRXVzJrYW9rMzhaZm9ES2FvZytz?=
 =?utf-8?B?dHRWcFZIQWU2ZmlBOTlsVVAySlhCcXl5ZE5TOGpCa1JaQjMvQ2pXamZudjFY?=
 =?utf-8?B?UzZ1OEJ4NWFxS2pvWXVoV1NqOHllL3h4Qy9rV21tb0xaUXFjYTlicEYxQnNt?=
 =?utf-8?B?emxHK3NjcjZlZUlseHZUdGlhQzNVQXUzYm9sdTIvNUxRMWpaSkNwMVlUQmNv?=
 =?utf-8?B?UGNlSkgzOGFwSTF3dUpKcCtlOTc2RTRabGtLRDZTb3NaRG9BekNuT3RwRytC?=
 =?utf-8?B?UFRLdS8yYm5ITTNOQURLa210M1lsQ3RBQVlnZ3dKdDZYRnlJNnJVdTZobzhk?=
 =?utf-8?B?dEJCNjVCOHcvOW9veHI1S1plbTdwTU13WEN5aVVIUTFpQVJST0tJaXNubTRF?=
 =?utf-8?B?dkhRUEl0dmVkbFhHVldOcCsyemx3MGhLSndiMS9DUktiZzlrdk8wbTAyTEtG?=
 =?utf-8?B?ZHhKZzczYnlQc2JQWTJFQWVWSklmWlllVW9lQ0JGRkFpZHpJS2tLUDZRZkRk?=
 =?utf-8?B?Q0Mxb2lwcS9YZGIrT3I2VXg1VElkc2QreXBFdkFHNStFQnQ4Nk9ROFVFekNw?=
 =?utf-8?B?aUpDcXBaMkxmaGlBOVdHNXF2a1FtZTg3TmU2bmcyeE02QkMyZERmeHFKRnlu?=
 =?utf-8?B?M2JOTWRLSVB1ZkhpWWtnYjRSclJNbUxQWGJaTjgyYW83SFV1M0lINmFYbjdq?=
 =?utf-8?B?cW55TGFuOXI1NTNwV3QrckhMZ21tUW95bmk4QW5iVjFtWFpzSFRHUytYOStk?=
 =?utf-8?B?ZXdabnV3TFBibWxGdUNKY2x4aGE1UGY3ZmRBTjZWd0NKTkhNeVlwejZ5Y2Uz?=
 =?utf-8?B?VFdTWFNSVTljMlRnU2ljL1MxaVdqRWNiSW9ZY0R0bGNDL0t1SXpEWGI3T2hr?=
 =?utf-8?B?anV1LzNZOEpBUGJIMGZtMWE0RGhoY0Nxak04eENiaitSaU9CUXU1b0dKL1Qr?=
 =?utf-8?B?MDU1eUY4c0tkdFNxWHlVRWVuaGVZWHI3bnBDSklJZlQ3Tk9DdWdxWTJ4YlZy?=
 =?utf-8?B?VWxoa2xvNURvNUJTdkZXYUM0RGczUXlQVFFSM0ZkYUx4QXRpZWZDQ2NTa2l1?=
 =?utf-8?B?a2I5Rk9PbEIwR3RuSnRFaFpUT1JyUHJHeHNERlNOOGdsL0FYN1A5YWFOU0RI?=
 =?utf-8?B?RG96SzVkVUN3MXNDc1hsUnJNaHZRbnhtcStIakxNVzgwUWpWdEQyS3VHeVkr?=
 =?utf-8?B?YlVIK3dmMWZmRmRPTkFpSWRwZzlsTFJFVFZhZFJwUFE5YmlxaTNmN2ZpaDB1?=
 =?utf-8?B?bk15VVZaUzBSVExWMDkyQ2VnUHJjdm1HVTdneXE4RDlMZEcrcW9UU01UUWxH?=
 =?utf-8?B?Y1ZzZkRPU0hTL3Voc1M4ZmUwYUxnbVJQYkQ3M0pFKzBOMEFDMXVDdElpdjJt?=
 =?utf-8?B?NHdHb3pCckUxemlaeVNxTEc1ZXJ4VGVuVmk4MkpNaHRZQ2tJZ0xxL1lxalBF?=
 =?utf-8?B?cVpSRmloNnE5UG12bmVDWGJuT1dkYXkraFFnblRBcTFLakloOUlZdWFUTml0?=
 =?utf-8?B?TGh0OHpGcVNpMFVYVjFXaThVMGZVRmNmRGZmOTRVdVNzOTFKREp5RDJ3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkQvOC8rWldWbkEwcG5lQmtRTC82R3U3WFVEVTRjZFZWeDZRSXlpcWRKak1n?=
 =?utf-8?B?THZWVWlkYS8rbGFUT2VpeW5aNHA1emNWOUdKREhEQjIzTHNndW9Pdjd0ZXIy?=
 =?utf-8?B?ck1lTHpnVmVVSEw3ckNsSC9KMzd6eTlGRnQvU2Nic29BYnptejFuczF0MmV4?=
 =?utf-8?B?Q2c2bWE0QjlPbWNXelFKcUxaU05qRlFBYjlNM2FIMFJTMkhORHdJM0xlaElG?=
 =?utf-8?B?MzBDeVRXQlpJbDBlR3JKK3dmWUF3WlEzbVAxMUtFbDd4ZXIrYjMyVlNrUlJv?=
 =?utf-8?B?R2plVmFSeDNhc0NLVnV1S0t0cEdNOGZEbCtzVmNiN1FxWXM5a1VsWnBGekJ0?=
 =?utf-8?B?UFQvT1hzTXZlelJNUmIwdG9NU29pWW9aL3drNFFzVndWc3VpaDdZSUExWS92?=
 =?utf-8?B?ZGI2eVBMOThQUXJ5VzdIWEVDR3dLeW9Gc2VvOWVTNWhoRC9FYVQxcHdsWkRC?=
 =?utf-8?B?UEl3eEVEVytoRUZER0d2eFRRTEcxcXl2djZqc2JkQUVyU1JsY0Vib01QbEJK?=
 =?utf-8?B?bzRnd0VWZzJUNXhJL3crUVlQdjlsY0ZXOEJyK1kxR045d28wdXY3djF5aTY1?=
 =?utf-8?B?c0JNa2J4VnZSN1Uwc2dnK0N1L0ZYWGRmZHNwYkMrZFE4VEVxbGlOZnVwTjBB?=
 =?utf-8?B?ZmpUeitsVWdFazNjOWNuUzRIQTBrNjRpaWlnZWpCOHZBdXpSUUV5QktCWDk4?=
 =?utf-8?B?SlVRUzUwRWxBT3F2SUplRDcvR1dqRHI5ck9QeU1Oemc5YlY2a2FZaGwvOTRU?=
 =?utf-8?B?QlV5VXZZYlZwOWZpZjB2Snp1WFNBOVRSZTZRY2dCS1ZkTGpjSzhuYi95ZXRE?=
 =?utf-8?B?Q25SWkxvRkJNMnRUWEIwNHhva2EvQi9EZDZXVlRKUFJOK0E1TWl3N01nTXdW?=
 =?utf-8?B?QWdTZFZ1cXQzbHpWWVUxT0RTQmREcEMyeUk5S3ZJek1kQ3NEVkhqeDlzZUNn?=
 =?utf-8?B?MWFVL3UvUXBGQ0ptbTJocndYRmVicHBwNFlBNDFDWTY1dVB3cnlNeTY5bWU5?=
 =?utf-8?B?cTZqSURZUXBJcnJNUG13SURXbFhYcnNLWGlLNzdOc2xuNXBCL08vNXV5dkNi?=
 =?utf-8?B?elEvckpMQ1dwUWdQWmdhRXBvMENqMmhEaExIRUJXdnN6bmZpczFCTzRPR3dI?=
 =?utf-8?B?N2duQ2g1V1p1UHh6bXdBa1BUNS9SYU95SkdBMTQ2VVpsM3hadGhxclAzVFlh?=
 =?utf-8?B?Y2x4TGU1YitoekljZXd0TmtxdHFBb09UcWJDcWkrS0xqRmxTcmZMblRWK01r?=
 =?utf-8?B?UUJqUVpkbHdMSGJIYVA4MVZCVU81ZU1IRVAwS09VTitwRWl6V3V2YlMxeHo4?=
 =?utf-8?B?RzNWcWhaRHpHanJNTTZJYkp3R2E2eldhYytWaXppUmxJa0JYS0JkSXB4RjRw?=
 =?utf-8?B?enVxSlJhdnBJNjFBY1RMcnBQNjZBRlJPbExNaWxMeVpqNlI5K3I2UE9DR3VK?=
 =?utf-8?B?ZzFEYjdWNnFWYU45OFIvdk1hdEhGcDZ4VlFnM2g3VklOVkF5ODRZR3plbk1F?=
 =?utf-8?B?VzNnMDNTL2RNa3BBbXFSSlF5VW11R3FORDQrUFQ4VThGYWpFUHdnbEdHMnBh?=
 =?utf-8?B?cjNjdjBXS09ZSzFHYzFZeDZvdFZOeGpMVHN4anpoVDhlSXZySlpXZzI4NDNK?=
 =?utf-8?B?K09MajNUVDBDN1A0QUxBOStTUUs3c3VGQnRUaDVYc3VoOHFma1JwNkEyb2pH?=
 =?utf-8?B?MXRuS1djeVRQd1MvdkNQNHFMemNOTjNkSEkxdjV0cFE3Ni83WDRDRXM2OUpt?=
 =?utf-8?Q?2nsksC2cKSxp18i/UhbLXyc2MNd8PaVsR9PI/O9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50715b34-c187-4697-c17f-08dd5657696c
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 11:19:21.2035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPFF14A1AEC4

FYI, I hope it would be in v6.15.



-------- Forwarded Message --------
Subject: 	[tip: irq/drivers] dt-bindings: interrupt-controller: Add 
Sophgo SG2042 MSI
Date: 	Wed, 26 Feb 2025 07:51:36 -0000
From: 	tip-bot2 for Chen Wang <tip-bot2@linutronix.de>
Reply-To: 	linux-kernel@vger.kernel.org
To: 	linux-tip-commits@vger.kernel.org
CC: 	Chen Wang <unicorn_wang@outlook.com>, Thomas Gleixner 
<tglx@linutronix.de>, Rob Herring (Arm) <robh@kernel.org>, 
x86@kernel.org, linux-kernel@vger.kernel.org



The following commit has been merged into the irq/drivers branch of tip:

Commit-ID: a41d042757fb36f982413622e890a1c41e043000
Gitweb: https://git.kernel.org/tip/a41d042757fb36f982413622e890a1c41e043000
Author: Chen Wang <unicorn_wang@outlook.com>
AuthorDate: Wed, 26 Feb 2025 10:15:01 +08:00
Committer: Thomas Gleixner <tglx@linutronix.de>
CommitterDate: Wed, 26 Feb 2025 08:41:27 +01:00

dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI

Add binding for Sophgo SG2042 MSI controller.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Link: 
https://lore.kernel.org/all/44de02977624be334ba6328acfdbb2a375f2071f.1740535748.git.unicorn_wang@outlook.com

---
Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml 
| 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
1 file changed, 61 insertions(+)
create mode 100644 
Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml

diff --git 
a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml 
b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
new file mode 100644
index 0000000..e1ffd55
--- /dev/null
+++ 
b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: 
http://devicetree.org/schemas/interrupt-controller/sophgo,sg2042-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 MSI Controller
+
+maintainers:
+ - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+ This interrupt controller is in Sophgo SG2042 for transforming 
interrupts from
+ PCIe MSI to PLIC interrupts.
+
+allOf:
+ - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+ compatible:
+ const: sophgo,sg2042-msi
+
+ reg:
+ items:
+ - description: clear register
+ - description: msi doorbell address
+
+ reg-names:
+ items:
+ - const: clr
+ - const: doorbell
+
+ msi-controller: true
+
+ msi-ranges:
+ maxItems: 1
+
+ "#msi-cells":
+ const: 0
+
+required:
+ - compatible
+ - reg
+ - reg-names
+ - msi-controller
+ - msi-ranges
+ - "#msi-cells"
+
+unevaluatedProperties: false
+
+examples:
+ - |
+ #include <dt-bindings/interrupt-controller/irq.h>
+ msi-controller@30000000 {
+ compatible = "sophgo,sg2042-msi";
+ reg = <0x30000000 0x4>, <0x30000008 0x4>;
+ reg-names = "clr", "doorbell";
+ msi-controller;
+ #msi-cells = <0>;
+ msi-ranges = <&plic 64 IRQ_TYPE_LEVEL_HIGH 32>;
+ };
