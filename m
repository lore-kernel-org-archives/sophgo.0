Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011034.outbound.protection.outlook.com [52.103.68.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820C1221562
	for <sophgo@lists.linux.dev>; Mon, 17 Mar 2025 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201020; cv=fail; b=QkG5pMWlM1CpTKR5QBL7B0tNRKUITWXILCC9t2Dn0G4b7T48JWtv0OOqAF+L3fIusDjiTB1fxch7yFw2nUmIjRHyaL2B7GQO2aDjKgtCd1UaIDEZ/fY2bYMkj8YEU2k5Vwy2rF/d5Tl0oeSlCzh1vnjf3Afd9wikU/dDyVuzucc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201020; c=relaxed/simple;
	bh=9dzE3LiPawrleWUAIieXM7T7R4gf1ZiHgJiSOmrejks=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=MOQ51FZyIQFyF2LpaZkXZGbT6eZ+9AO5n8c0L7b8bIrZsWyRW9iPOiH/ieGFb6fl61w49LclDknZppBH9TXpoean1+RJzDXIdpwYYHB9n3+kIWjjbukiwhLGnVpsv1Lvf8CzjRZSJCwQsZdLIlYkkI1vb8nLcqMKlBFp6CPwOL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=av1nc7eg; arc=fail smtp.client-ip=52.103.68.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="av1nc7eg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q85LbWhIXm4/mJCt0jBKt/nU9Xkalzstln61Q4I6k2pEOlzHEccxoTxlwXKsYhBjyIozEHXpMtmx+5ssO8UmG4sC+BxGKyBqXiVS6xYEnGhrznQ/5U7WdszDkreqPH1woJqPIAjSY86UFX0T6bIlQkLEr8U+aliaUOVTviRNNcUk+yVUSgvDB1fErvD8tj1xuOxCI/N8uCHwWBldLhatfAR4TZnJUzhiVQEYGlDyowJ1OxzM4SPUPwJNinCjSmOU+7BfG1ESsKcj9r3P7wYBvw8MeQeoXMWgcONedbCITwrSnM67YpHfHM4Fl15x0sRYAJSeJ4u+sf9Td6yh07VaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiPpljwaXvTpI//zi0SFgK9TSa+bMCP//eAc9sB0V60=;
 b=gY5onVc3Fli1kt0cgmKzKtpwPVLPhMsh4Tv+0gBfEvyEDHA5xl12eGJq3GMKIgzldmvR6csI8CwWMkLh8JBZCjdZQwfQtzjRD8UILN3SX8Zzq8ydZceLXWaBxC1D3hAiXdcONdMVBpmRdk6RBPGHyxztWlpekBkBqc6QcN3TAtqprmmwsA62f5iW2AKf7Ao2gTctAjlack3IPIGtH72SdYixk307CTo0zSYtZ5qWvEDVc3Opjm5RD/OLfNkIGrNg/A2c7BQh4MvOkKULxKrTqE8mET4FbiF7qaweHJy9KWFTVbZzo9HDX2od9a/ILf/0yVS1i0v7W+LyLjUl3XMKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiPpljwaXvTpI//zi0SFgK9TSa+bMCP//eAc9sB0V60=;
 b=av1nc7eg+bjeX5NUgteKNpBgFpu1wy0lfVbOkzYrgtiuPT/hgMAyPWbpWw+4XmvZQa/YK/n5ZtDYY1JoMR8BIGW4IEr36xVda0tqeOmcg6LlGwBcMEcnefhcZLLFvGq9xFlfH+notN0LMVr4yI7GrJdwRXOUvlOGquja4dIrGfx3CwKbmlYYGppzOEx5CTMVzcIIOtPjqvYlcD21rAL6Ls7kjmsUXQ84tupcBPqapovfuO7tAl2q0oUDTY/YnXyWTLg9t2qVGVkO+WN7xkSKYKdh/jgkbweK2/sUmPiIIr3HGFt+wy+c9S7q6AiKKjhv3MvsYfEU/wEz5wBa2BYQoA==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by PN3PR01MB7838.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:43:32 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 08:43:32 +0000
Message-ID:
 <PN0PR01MB10393CEC71B623E0A779E7393FEDF2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 17 Mar 2025 16:43:28 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>,
 sophgo@lists.linux.dev, linux-riscv <linux-riscv@lists.infradead.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID:
 <9241aa49-822c-48b7-8cc4-bd83cdfc0987@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|PN3PR01MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 002fe684-648a-49ce-670d-08dd652fcc1e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|15080799006|461199028|6090799003|5062599005|19110799003|8060799006|5072599009|10035399004|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWNyZ1lrbGFWNXk0V1pMMU9BK2k3VkRGMXVlSkw2VndmR0t5T0ZhWndwVnUx?=
 =?utf-8?B?dWc3Q2ttS2NnTk5KVFczY1MvTG1KcklCbCtIUS9pU01tMG5Fa3RZejZZeW9u?=
 =?utf-8?B?NzZuNDZDZHBKNnNIQjhzdXlBc2VsWVRRblJSc0xkaUd2VGNEVDEwalZEVThm?=
 =?utf-8?B?Z3RiMFRQZjBKbjhFZlhCd2dyUnMzazVEcjBjaGRHTGtFYkZnTzdKaGFoaVZL?=
 =?utf-8?B?d2xtSm5zZkxHdTh0eC9ueVlOdVlzU0xkaGlnNk95eU12OXpvWG9CT0JJTW1F?=
 =?utf-8?B?dlZ2SzJFZm1zSW1xOGFzS1pVQjBCOUVHZFdUbnBNc0dNNVVYZWxXamEvSVoy?=
 =?utf-8?B?M0d4VXozTWVMSEFldWFIeGJHY2Z6dVBUY0FzMVRnbVlicTRuTzhQdXRjUTJL?=
 =?utf-8?B?dS95YVlzRzdTNmlSZGF1WGFaaktjWnI1eHM1VGhpVmR3WDRoV0d3Z3dIZ2pn?=
 =?utf-8?B?MmIwRGtSWnE1bzJkak1kYTJnczIrVWRRbDBjZWR4WTZGakVBYmdJQmJMSVBs?=
 =?utf-8?B?TUV6dW9iQVZIWjEyaXBVMllicHdIai9xR041NlQ2UUlXRUJPVlhaMTA3N0hp?=
 =?utf-8?B?U1VraVVwak1aQS9SVzE4U3ZDU0lVd0pMV2c4SDVLbElkQnBvR1ZRZzBvNGwz?=
 =?utf-8?B?T2ZhSnhST1hDaFdkTjJnM3huUEJ1cUxTcGovWkxqSXBiVnp3bnN3LzF1dVA5?=
 =?utf-8?B?T3k3QXUrdG9LVjFudjNtcDl1bEVIeUFUUkRMeCtGbGhCblg5Z0E1MnlYTlph?=
 =?utf-8?B?a3J6Qmx4b0hVdmlDY3NxT3NkK3ZzRTFqRVJHdjhIZENsY05rQ051d3N0RGo1?=
 =?utf-8?B?THZUeERmRHYydzB2RGtxdWt5Z2lTeEV3aXp3dFZKOStTZkQzUE5rekJSekcx?=
 =?utf-8?B?ZW1kQjZtZGIrY3gyRUdUR0hscU1tSG50RzhPMFJlRmhxd3cxOXVoZjQrR2Iy?=
 =?utf-8?B?S3pib0FGRUtIczArd1pyZks2NHJUWnEveXdUY1MxQmZhVmlXb0hmS3l4K0Fq?=
 =?utf-8?B?MFVHVnZVRnM0VFJ1YmZzbk1jNmhqelR1L0k1aVdVZ1NjenowR0IwR3hRLzlo?=
 =?utf-8?B?ckozQlpTOTlUVGRaSWxwZkFBNE9ETW4vRGlkcTBtSnA1VGc5Y2J4bnNTTFNS?=
 =?utf-8?B?eFk3MVZOTHBvNHk5WW9ndFQ3MTRqZW5KZmpiTXdWa0tadW9FZXIzb20vU1Bz?=
 =?utf-8?B?L0FDOVlXVWw0Q3FCMHgvdzdiWXUydjh5Zk5UQ0dzTzlIbTEvVlhEbEFhSklr?=
 =?utf-8?B?SFZUWXNxQmxQa3hZNk5ubC9Ob1FyR3RudjNJZy91aFFQUGYzcHZESnI5aFUw?=
 =?utf-8?B?dzFtc2g1RnJlQTV2cjJndWp1QXpwc1BaRUVRcHNHOWc3WU5zcEUvbWxHYm9T?=
 =?utf-8?B?MERGSGhGVjduZFJYT0cwb0FLYTl1K2tvU1hPdWswWEp2NHFlYjhrYk51ZXh6?=
 =?utf-8?B?cG8vWElZNU14cUpoOEpid3pEYldoa1FBVHNkbFFITFBtSWNhRCtTSzdMRGpB?=
 =?utf-8?B?TTdRWG8wNHVFQlRkb3VhbzJyU1E5ekpUcm5sTncxQzJSZ1V0Q29VR0VVOS83?=
 =?utf-8?B?SjFmRlFjSTZ2Y29HVEtuUWlpRFNLMFgyU0VHMEVaaGduVHBoakhaRjFzbE8y?=
 =?utf-8?B?Q2F5ME5OSjlQY0dnaWxjejRpL3g5TFNBYnRHNnhzWGVtbkc5czIycW9Wd1Bq?=
 =?utf-8?B?QlZmZjBZZlk1NnQwR0Q5ZlFrN0NYdysvVUYvSEFGZmIySG1BeWdUeC9RPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU9OOVZ0N0gvK0NuMlE0VGxFcmo4alNJKzRIODlYNWc5UnFJUjV6YWlNcXlz?=
 =?utf-8?B?UmhXRHBkQmo2eWF0SUh6K0NSbHIxbjRJbDRtUzdldlBwODQ2S2JGb0NUbzhO?=
 =?utf-8?B?TzhkWU9QYVF5cXVINUtwNUlKVldETGR1dmhoQ3ZJa2tmZlNZeklQakpkL0NH?=
 =?utf-8?B?ZVVkOUZsWmhJZEtheFR0UVI2RlFVSEhzN0hYaXVuNGlxaTM1S2pSbnl4SG4x?=
 =?utf-8?B?WW00MmsyMlNxUytGSnlTNFkzaVRtU2xrb01VM1gxVkIzaHBmQndRUWhyTXJW?=
 =?utf-8?B?OUZGRHN5dXBNemM3NUc3dTRlUU1FbGdjQmlUSVF0b2ZCQUxvcVhMbTBJZ1dt?=
 =?utf-8?B?TXQvcnFjbU5mNWx1b3dMVDFieHdqT0xpK2REYzBOVEUxcHViMXl1NXFmVkZ2?=
 =?utf-8?B?SEkyVll2TnlrejZNNlpsajlpMGRHUGM0cktETXpnNGhCUDBPNTJEVFFVYnBC?=
 =?utf-8?B?UlRic211di85dDVNVWN4ZWxINTI2cURwMHBHdWtPeDJNcjhVaXpTNHpqWEpG?=
 =?utf-8?B?YUNnMkZXSzQzbkxkc2hzQUNrZHh5TUM2SGdCTjVWNmkxbm1UTWxrZXZoRnJp?=
 =?utf-8?B?c3RibWRvcVErSUpwemhDTVNYTFU3Uk94cmYzbWVMS2h0Y0R5c2xYSzRNQ0N3?=
 =?utf-8?B?cHdqUC9KVVlrNnd6OWJ3cTF1NFUvYUpMVmZMSFc0TDZHV1E4cDI2b2ZNQmd3?=
 =?utf-8?B?eitxbjZ1cFRnclA4cW1nbFpCL252UDNSNm94VlFIbFdKSmVXbWpDQUlndXh1?=
 =?utf-8?B?dWphSnNVaXBJalA0ME9xQW1oNHBhRVc5TEhwRjY5bHZ0TjBQUW5USDVDUWNk?=
 =?utf-8?B?Tm42dE5xRHpxaEhKaEVvZ2U1QktiOFRVWW5CbEVwTnVmbnlRdFh2bzJudUpN?=
 =?utf-8?B?ZXFPblJpak1oS1pnV29JTlpzSEkrbFlrS2xvbEpwd2x4SlM3aVA3WXZyV2Fn?=
 =?utf-8?B?ejZDcTRRS3ArUm84VEc4RHdpQllpblN0VXFKYkpXbG15bEFPRTZFM28yaTla?=
 =?utf-8?B?UjdSRVVhN2h4YkJMMkV3Sitxa1VseXFhU2NNUzBaRW9NTzdoQTVYNWs2OWdG?=
 =?utf-8?B?M0h4dmFyS3cwS1hRWlBYaCtrbGR5RWZKc3NiZEx4TlJpSklOTVRGTjdUcmFC?=
 =?utf-8?B?dlZacVlscmxuN0xDNy9rQ096Z3NJVWV3a1E5bGE5SDQ0R2Z3YUQvTTM0N3VI?=
 =?utf-8?B?RGltSGcvQ0tHQTh4NXRNVWdEUDJqZXdTYWN5NnFKOHlHQ2d6aHlrbm1IcWxs?=
 =?utf-8?B?Vm5ZYjc3aUQ4SktLRk9Na2t6bldab2llMnp1bUVOaEdtTllFWXpqeWdmazRq?=
 =?utf-8?B?RHpyUmtFN1Q5MDZNajBhZTBHVk11WUpEL2l0RmN5Y1pqMWt2M0R6RlA1SUUz?=
 =?utf-8?B?OHZYTEN6cnRZTVVTcUlRcVhUZFdiMmhwcVpaRE92anUwWTJZT1ZVUWw2SDZ1?=
 =?utf-8?B?NFV0UTVIQVcyTkdJRFBacVd5ZHM1OXk2SWFHZFRwcFc2R1lCR2NVRHNhTm1z?=
 =?utf-8?B?Ynd5QnlyT1pIU1k3K2RhMm42UGFjT0ZDUk9xZE8zY2J6ZlFES2tNZmZIZTNX?=
 =?utf-8?B?dkJxQUpVcW5qNXNDRXp3RUhJZmlJMXR3WCtUbW1teUV5NUZ5MkMzajByeWx6?=
 =?utf-8?B?U2lDdjJOUnJaYjJxYytpY1FnYUIrcFNYVGpsRjcrZWk3YWtnZFp6Z1J1T2Zt?=
 =?utf-8?B?c3ptNjd4Q2ZkRVV1K2NvZGJrMDQwZzN5cEorMThtb0ZEcUptdnE2L3k5aU5r?=
 =?utf-8?Q?uD2bOP7ZJsmzSzC6buJHZi7zMTgQgkqCeumt0cg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002fe684-648a-49ce-670d-08dd652fcc1e
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 08:43:32.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7838

Hey Arnd,

Please pull dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.15

for you to fetch changes up to f047a9285f9f3fd5c0d5ae53af350b8b619e470a:

   riscv: sophgo: dts: add cooling maps for Milk-V Pioneer (2025-02-18 
10:11:37 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.15

Sophgo:
Add pwm controller support for SG2042.
Add pwm-fan & cooling maps for Milk-V Pioneer.
Updated MAINTAINERS info for SOPHGO DEVICETREES and DRIVERS.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Chen Wang (3):
       riscv: sophgo: dts: add pwm controller for SG2042 SoC
       riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
       riscv: sophgo: dts: add cooling maps for Milk-V Pioneer

Inochi Amaoto (1):
       MAINTAINERS: update info for SOPHGO DEVICETREES and DRIVERS

  MAINTAINERS                                        |  4 ++-
  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 36 
++++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/sg2042.dtsi             |  9 ++++++
  3 files changed, 48 insertions(+), 1 deletion(-)


