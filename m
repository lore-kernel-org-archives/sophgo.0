Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010014.outbound.protection.outlook.com [52.103.67.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DDA221554
	for <sophgo@lists.linux.dev>; Tue, 11 Mar 2025 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741677361; cv=fail; b=OSEfHXOlc2IDuLyzbCTC4kQXgrLmU2TlOc+5nJ2wQRTtaiHtCn3j3OklkDsUcCCW91J5+PRCpU11JVxHavp0gULhXF3Bp1UYGXCGB/BEJh7POCkk3b2YN8YWUNep44USlwpi7COyout46PEuBYg4lPpLv88Jqt8q72lX9ITSDig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741677361; c=relaxed/simple;
	bh=aML8CFQl4LfiBIKsOrWn/uPrzUC4Ts8deQvqN+XwU10=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=h4SihklNDbozM74VQd0sDXxyzL7gMgAZyDnsRlNRlMZBbfdToifzLrtelziawB7wGDhDLD9LhCD19vTAkXc7bjrJ5rSVt1yCkqUo3OEYA6qD+wfmKgsGY46MfB364v5M/bjY+dpd1KmAy2EY9uq9XtCiV4vnBdTPvlMbOCV2Kcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kRfQU33s; arc=fail smtp.client-ip=52.103.67.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kRfQU33s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7O3pGwb8dpjurf8x7kgxaOmLoZ0flX0TObi/sh9JkA835A5wYR2msGXVntXiZIM1LOWwpc6PH8eFzWzczl6CWIwrX0dmOyqY822iAn+YWgoMyCU2ajOWJGc92LE3Cgj0seVJPiPE3AvzWH7Pa4sIGHFm9QFJKp5fG1uAf9ije/15EWaX3y82oxYnV48QGBI1LryrCE2FdRJHlH5u2CebezwatH2rFBodnYJwb1jECiDrKGEudk05k8A9Ni6+uq1jubaO7NZKfxKqyI/9+fe2BOyK+165CfVTaTWjF/ePnbND5hTTBjuqCsMxWxoWUBvAq9JBZZhjiAt+Q4KeUZlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSUoYHvL+c19wFET5CwQqIegg4vCDnc0VKbkO4nYiEY=;
 b=u5da+zyt/Dd2CYkAl+H2bKmZBeNr+EdP9sl9cm/MPqPyh4hEtwA6IdxB8HChyJi8zrpx0EJ9jJ4R+nhOO+kLLsbtioSfdwN3xH25JSOyfQ/RM8FEhZ3Qs9Npehd0NRE43KslYNe56GfP2iU84AvXGmgLNoc1n9PuF9SjRH0o8xaHesep5Z39Ji6/aoz+PvND/suCm3IRIa+XIa7rUIGHmcRdpfXuNgGotV5SEDVYnfgvJKP61GRzMiP5DDbFGbA2+Nfa4cBp1XwO+xfqFV40qDl9OEpiGUoIc4XTJAWvAtMRtUkid1IxXQu1Zn2js3p+26TNMvC72go0Q5bC9KXH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSUoYHvL+c19wFET5CwQqIegg4vCDnc0VKbkO4nYiEY=;
 b=kRfQU33sqsqgPkuFCMzwxKduRMUoLrQsIPxiedCcW9n1M/RhQa0DbLTQ2sx3Get7RsrLVao1X7wLzyTuO02y1e8ReO7NJVOraKGR2DutODzjM+LJ87lga0XDM5zrzIUSQorjPBAHs416Pk+P87aLPo4E4tqEivPddHkJskeJJyEbEdacYge3peNBE0oJL4xfLgydwjJqtldBAeYcgseAMYdHoM6Xl1We+qhEpUte923abXRvkIWtTPEzmDRkibd5bdW0u5e1fadDeYB3Ncm+wTtKyZPO1zrCcCQYixt3MheY+MlDJUkurTljy7kcXcH9/9MpwAvqvaKGChA7dSdPDg==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by PN0PR01MB6461.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:72::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 07:15:54 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 07:15:54 +0000
Message-ID:
 <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 11 Mar 2025 15:15:33 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Inochi Amaoto <inochiama@gmail.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>,
 sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::27) To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID:
 <ffe6cffa-d5d2-407b-aebc-27e28f7a5525@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|PN0PR01MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e8d020-bd9c-4571-237a-08dd606c8ea6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8022599003|15080799006|6090799003|8060799006|461199028|5062599005|19110799003|7092599003|5072599009|12091999003|41001999003|1602099012|10035399004|4302099013|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXJHSjg3dDc3K3ZBV2l5dDAxV2JveCtTVXFGRlVkendJNjhoZ0ZydnJyZnBu?=
 =?utf-8?B?bzNIZzljNytaZ1NSM3pXa21OdnFDODRHUnF4TE1YdUREZ0swTmxPbW5IVWR4?=
 =?utf-8?B?RUE5Mjg4S2tqZ2drVlRlS054TWtNVnUyYk5xSTcyTG9yWjU5aDEwT0VyRGp5?=
 =?utf-8?B?cCt1NURKazViVEptd29sV05KamVaZFlEalMzSC94UWJKL0NlNTNhdGNKSFFm?=
 =?utf-8?B?TlBVR3VUcjVQQTA4WW4wZkpKa01BajMvSExEOE1RYk1KSmVVbHNsc0ZjSmtr?=
 =?utf-8?B?V2hBSFBaMU9uVnd1ZmZMRnN5TnpUcVlNQ0JGOEVwRjQzSE1XRWt2RXJvQTd0?=
 =?utf-8?B?VXZHSDU0NmpPWjRXWkE4THVFQ3QvS2ZhQnlNVG1uUWtnYlhUY1Z3OVVOYWUy?=
 =?utf-8?B?UzNaTnpnWHU0dU5QdllFMENLakF2VzExYWR6U05EQTJPM0ZOMWpaQ05NVjRE?=
 =?utf-8?B?YmtFam5pUFV1V3JQcWdWeFRPaWl2cFhiNTZkdFlSZk5aRnIzYUN0VWN4SzE1?=
 =?utf-8?B?ejVaaENMVC9YanFoRUZQb0NpUTQ0VkE4MVAvT09Ua0xLN3FQeDF4SVlKQmFC?=
 =?utf-8?B?YVc4SnBZQi9sWWEvYXdYditOU0ZnWVM4OUN1dXNUZTRlUk42aCtNNVRXbnlx?=
 =?utf-8?B?WWd3Z2lybjMzRW5JbXE5cVdhSCtaM3ZyOWlxWVRYQ3Z4WUw5d1hRNlRRL1kx?=
 =?utf-8?B?RnEvWG5vS1M4WjN0OXJFSDJOTEV4UWtWc1JkM0RjS0RxcjVtNWFIQUZQY0ti?=
 =?utf-8?B?MzlDRkZpSjlVcWVDeWsvMVBuTG5rZ1hFb2QvTjV1Z1NxSC9UOS9OdDJHbExz?=
 =?utf-8?B?ZlZ5bjc5dGRrQk1BN2NJMjQ5cDFDc1l2NVUwZkpJWSthRXZxZnoralliZlpy?=
 =?utf-8?B?NkJDTzhUcXZYdnh1c254OVFxVGdIaWpiYlo4OUlQREFzL3RIem44c0N4UCsx?=
 =?utf-8?B?TW10SDFuNnB0ejJvVHBYamxmYjh2bFRGemtZTlY1Wi9uYUhYcHVsdmlqSEdJ?=
 =?utf-8?B?aFJCMTVrRjQ0eTJlaFBSR0pUcVFVVlZLakhidGRDaXhtQlBCdFlhQjIxU0hi?=
 =?utf-8?B?MFBZdzkvaXJJcmF2NUFJZ3hrOEx1ZEkvQjRmOGJ4SmNZQ0M0d09Kb1pvYW5D?=
 =?utf-8?B?MndqSnJUNHFkYU01QkNTUWFia2dRMW5LZVpDOHRQTlVaS1JNN0w0U1pubVps?=
 =?utf-8?B?dGxpK2pJRWpTYW1DckFhdk5NY0RSQU9BTG0zZFoxYTRDV3h0aHRSZGJDWWlu?=
 =?utf-8?B?N3oxamRJRGNPczlrZkNvR2ZsRlF6RVFpd3NxNWZqSlgzY0dDU2xvOEhCdGlB?=
 =?utf-8?B?SkxlOFBlR0szdE5YTGhoWFRTcHI1M3VCemNmSWlhQm1mUGtGNWpzeGNDU0V5?=
 =?utf-8?B?OEpFVTN3cGZVbEw2QWRsbWZHNnRrTm5waDRyVGZlVmZLYStuUmZaMXYycGxF?=
 =?utf-8?B?eEhvTEZ4Q1RCWEJiL1ZWMEVhbXdiU0xTSitkVjh3QmtsNS9Yem9hKzkvM2NN?=
 =?utf-8?B?cE5wcGhzN1p6L0VCRE5ZWmdUTE13dy8ycFNkRVJ5ZTMvbDFzUmo3d1JhVGFT?=
 =?utf-8?B?MGkvZTd1YUZyRm8xVGFxSml4OXBweGZhS0Ntdm5hNmhUWEJmTC9FRmlreHE2?=
 =?utf-8?B?R0FVcnNNbGtpbjduQTNxOEdERFpMT3RvZ2NleWxSYytFTVJRSTlIbUI1M3or?=
 =?utf-8?B?L0FVTnVTN0xYeEFCZzZzNXYvNUhYbWo2ajhMOWFxSWtVRHB3MVhsUHBGMmx0?=
 =?utf-8?B?RmxpWkErN3hveDY1WG1lNklLWnh4WWNBbWc5S3p5QUx3c000YittcUhuWVRE?=
 =?utf-8?B?Y2hyc1Rrd1c5YmtsQkZMYUNHeVJEZ0hjanBmRjNEME90VGVrN0xvcmpJdmp3?=
 =?utf-8?B?TUxvT21Kd0Fad0UvZUN1TUNOdFQxYVNwek9id1pLOWVOMEE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTU2OFFGSnpzYzY2aUJyaTRwUDA5RVMwK1JDZUM4K1RkWUNTNEY5ek1sRWt1?=
 =?utf-8?B?MWtvVldXVW5Ta1NDZFFtRk5Rc1RkWmg5TkJlOExkY21QZThnanY0RzU4SHdZ?=
 =?utf-8?B?alJxUVBiQlpJcVovZCtkVXNTU2hKampvYzJKNTRob256a1BQaVY1dCt1ZmJM?=
 =?utf-8?B?azZIYjdXT25JOTBJWXdQWkowQUZTck5wNEFNaTZaZk5jNUhBMitZUk9Fclpu?=
 =?utf-8?B?MFl5R0Jha2ZQQjNWOHA2aCs0c3N0MXBoUHFCMTc3M0VPYmc0VWxQTk02NXJT?=
 =?utf-8?B?cXdSYkdCNkhhWUtLc1BUKzFVK0NGOFFCZXE5VEh1YUVCQTJLOURma3Y4RFZa?=
 =?utf-8?B?YlA5SXFiWmhmUjFPSXlDNmpkS1ZyTm82NHMzOTFDWHZPSjE3VHE3Qkpad0NP?=
 =?utf-8?B?RDdnUDRmWG5RaE5LM1l4ZzA2bitBenJtK3dqNVVkZnJoK2N6amZqcWdyalpv?=
 =?utf-8?B?SFpVZllpc0M2eHFteHF2T2lIcjJDL0FDZjd3T0Fkb08zZXZUZHdyNS9qSm5Y?=
 =?utf-8?B?V1oxcE5aWTQwRDBSQUhJaTFFYTZreWdQVVpoSFd0dDZzRU9vMCs2WHJraTU4?=
 =?utf-8?B?bHh4UFVwUit3UmwzbDhSUlZsbTNtek8zb3ZCWWI2OHIyUHZtNmNyUkRjOU85?=
 =?utf-8?B?ZlVJbFE5amV1bjc0RmVHR016QkRpM3pUSEc5SmsvWk52aXovdElNc0c3OUZ2?=
 =?utf-8?B?bmM3TXlZME5sOXptMVBoUExsUGtaVE81RHk0eTBHb3pobyt0eVUwZGNON3h5?=
 =?utf-8?B?MXlyaVArTFZzS2txQzVuN2d2QjhOb2VWUDBtWUgydExPaklndmFOdVdCanRm?=
 =?utf-8?B?RGExM2ZEcDAyVDA4ZTFSanI5WlhPRi9nUjkyT2dlbEc5cHpaMExrV3I1MjRl?=
 =?utf-8?B?WDZ3YjY1VUVRUlRSdXBlbytBUTJwb0VQT2VaemVxU3NNNjNxc2J4RkNLT1BL?=
 =?utf-8?B?Z0orSEZRNG5FMC81VXRrYllPN0VoQnkxQ0gwTm9KU1g3dE5KK3JNeWpVYnI4?=
 =?utf-8?B?eHhpWGJqeFdvUGdZeW5lK21iVzBQRnZuc3FPU0JBME91UUdhTGc4Wm9uSExL?=
 =?utf-8?B?SVRjQnpJelFpN1JCOW15T1AzaGJqWk8xU2QvcjVLaG45bFFiUWpKSXg4RzBj?=
 =?utf-8?B?NG5xOTQrWG8vZEZiemlFZWFuOXF1WSsrNFI2c1NOMkhldkN5T0UxY1BKSmU5?=
 =?utf-8?B?Z1lyUERVb2RvZmhSNVVYYzBrb1JsNmp1UEJ1cktFMWhxbkRhai9xM3RQTUoz?=
 =?utf-8?B?MnpLajJIRmxSdklpU3kvRTR2NXBWck1YT01nQ3VxZUxMbkpneVRkMmY1aVkv?=
 =?utf-8?B?RGkrc3Z5aFczYnRqMFo0TkJqbDBtNThRQUN1Mnh2cHU2RlNacVlGQ2ExYlpt?=
 =?utf-8?B?UzdhdXBaaWYreGtFNVAwWURmRHIybVVBZGxDSnFZUXQ3L0ZCTGhDWkYrVGJN?=
 =?utf-8?B?UlNNaGhobTVpWEFNVy9zcG5sSkRFWU4yVjJWMFJFTUIzYStyT1RjWDkzM1pP?=
 =?utf-8?B?KzhwczFEVUI5Ky9tZGlyK043RVAxZnVSOWlXV0p5K24xMjRGY1krU01taVQr?=
 =?utf-8?B?b3pWcUNnQmRUYzIyZ09Cd0ExSWNESFpqUWR3ZExjWW5TYnZCa2hWN0lkeFhQ?=
 =?utf-8?B?ZDRKcHFBNlFoUkppRzdaNVQ1REpNVFAxL3Z0Szd6VUxmOWZ2VDdxVXVYNVpz?=
 =?utf-8?B?RkZ4akFuYmNicFB3VHNaQzZqS0FoZFZhbkZsY3VVMWFNWERJRnBIb0FjdVYw?=
 =?utf-8?Q?CIEZ/D375a1cDukkUNYkYITBid1BowaJ3IRAnNz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e8d020-bd9c-4571-237a-08dd606c8ea6
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 07:15:54.1171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6461

Hey Arnd,

Please pull dt changes for RISC-V/Sophgo.

Please note that in the commits I submitted, I merged a branch ib-sophgo 
from Linus Walleij (see [1]).  because pinctrl's dts patch depends on it.

So among total 13 commits, the following 5 patches are the actual 
patches to be submitted in this PR, others are merged from the branch 
ib-sophgo.

5277657d5383 riscv: dts: sophgo: sg2042: add pinctrl support
f047a9285f9f riscv: sophgo: dts: add cooling maps for Milk-V Pioneer
62cdf0a06dd5 riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
8630ed6f2adc MAINTAINERS: update info for SOPHGO DEVICETREES and DRIVERS
255f83ba5c16 riscv: sophgo: dts: add pwm controller for SG2042 SoC

I'm not sure if this is ok for you, any questions, please feel free let 
me know.

Thanks,
Chen.

Link: 
https://lore.kernel.org/linux-riscv/CACRpkdYfZ8izsBJaKUd__jXGHnDBU9Tha=2kozjzHssoppgY5w@mail.gmail.com/ 
[1]

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.15

for you to fetch changes up to 5277657d53834cfbdbb9444088c1448b29bdfe98:

   riscv: dts: sophgo: sg2042: add pinctrl support (2025-02-28 08:43:51 
+0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.15

Sophgo:
Add pwm controller support for SG2042.
Add pwm-fan & cooling maps for Milk-V Pioneer.
Add pinctrl support for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Chen Wang (3):
       riscv: sophgo: dts: add pwm controller for SG2042 SoC
       riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
       riscv: sophgo: dts: add cooling maps for Milk-V Pioneer

Inochi Amaoto (10):
       MAINTAINERS: update info for SOPHGO DEVICETREES and DRIVERS
       pinctrl: sophgo: avoid to modify untouched bit when setting 
cv1800 pinconf
       pinctrl: sophgo: introduce generic data structure for cv18xx 
pinctrl driver
       pinctrl: sophgo: generalize shareable code of cv18xx pinctrl driver
       pinctrl: sophgo: introduce generic probe function
       dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
       pinctrl: sophgo: add support for SG2042 SoC
       pinctrl: sophgo: add support for SG2044 SoC
       Merge remote-tracking branch 'linux-pinctrl/ib-sophgo' into for-next
       riscv: dts: sophgo: sg2042: add pinctrl support

  Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml | 
129 +++++++++++
  MAINTAINERS |   4 +-
  arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts                  | 
108 +++++++++
  arch/riscv/boot/dts/sophgo/sg2042.dtsi                               | 
15 ++
  drivers/pinctrl/sophgo/Kconfig                                       | 
46 +++-
  drivers/pinctrl/sophgo/Makefile |   8 +-
  drivers/pinctrl/sophgo/pinctrl-cv1800b.c                             | 
27 ++-
  drivers/pinctrl/sophgo/pinctrl-cv1812h.c                             | 
27 ++-
  drivers/pinctrl/sophgo/pinctrl-cv18xx.c                              | 
602 ++++++++++++--------------------------------------
  drivers/pinctrl/sophgo/pinctrl-cv18xx.h                              | 
66 +++---
  drivers/pinctrl/sophgo/pinctrl-sg2000.c                              | 
27 ++-
  drivers/pinctrl/sophgo/pinctrl-sg2002.c                              | 
27 ++-
  drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c                          | 
296 +++++++++++++++++++++++++
  drivers/pinctrl/sophgo/pinctrl-sg2042.c                              | 
655 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/pinctrl/sophgo/pinctrl-sg2042.h                              | 
49 +++++
  drivers/pinctrl/sophgo/pinctrl-sg2044.c                              | 
718 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/pinctrl/sophgo/pinctrl-sophgo-common.c                       | 
451 ++++++++++++++++++++++++++++++++++++++
  drivers/pinctrl/sophgo/pinctrl-sophgo.h                              | 
136 ++++++++++++
  include/dt-bindings/pinctrl/pinctrl-sg2042.h                         | 
196 +++++++++++++++++
  include/dt-bindings/pinctrl/pinctrl-sg2044.h                         | 
221 +++++++++++++++++++
  20 files changed, 3265 insertions(+), 543 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
  create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
  create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.c
  create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.h
  create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2044.c
  create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo-common.c
  create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo.h
  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h
  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2044.h


