Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011025.outbound.protection.outlook.com [52.103.68.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046991DFE09
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 07:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998153; cv=fail; b=DNPECiUEDNV7ge09u3IZY/pJpeFNv7guUJsOTvcqO+4bhKUaCAd6d4PEIFGSHYpWZUPVaVMgzTPS1Th0H04Fl+wIOsRQSuYm6CczpmVwrCIow+tqUPw0XTv5xjxcL232x1ECjgWqz4hHV40kFkUxQj1gd1/StHqpZKcMmppaghE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998153; c=relaxed/simple;
	bh=nm/HWnu0cdvuf36T6yDPvLWYmQW6KmF+fm+fsytLQvM=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=J5hTWNWZZ3Di1OZiTRiEXS6HYSfiMDbXONWrEp0tzZkJ+dS3zkt+bYqynb5cHvaPTUz8ZvzlWXv60pCcuWgNLaH3fy/dYK0Gy8nG185UAlJGzoPtcVj4mEbB0RVXIQb/UWkKLsZtWyXIBMN/46BUG2XkHGb9Lw9ntM5uVsF6A74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bTWNdlOd; arc=fail smtp.client-ip=52.103.68.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bTWNdlOd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=py46PXwE46QLhm0MktWZS63FCJqcvTzWNh7NmVljwq6uXe4AOqere4mts78QZ+zKAvYgtNY8yEKGpkOKlNJ27/qg7fpF/OWgjRsX5SHNnsqhoZ3jqs4iPVvb2/EZN0HdFjxZCrrzBpQqJAPIS7dTexvv/WXn3uMwzGOj39I5+dD4f7CkWq3tA6v4FlUBbRnT7WGci0tJ8krUMwb3b/Q9kLYdC2MxMme/LtGvO/8n+w+wvy0sW79stVjA+08LkcgQeAoCD0JWuLHjbx8dkkjeLIMpxm8tCiBDkTUz2XTnePKrveEQBrS0crpX6w7L6lzOyc9tWcQchCxk9FWQT2ixGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq0OkZCM4NvWqI7l52vAB0yZqeic5UlySv4Iz7q5Lco=;
 b=aWMmR4Y5gwr7ZYsDBM090wHFAimtcWafpMslWeusNuMPK8mwj7h+9+aM++ZLGUwL9CUQILmwWEHB6ALbNrwF91KNpv3HhGwqdXtAVIhQpJmcpHHqEJHU0+ZatXUZ5gg5zalsv+wFX5vakGueOPAHWcNlXwU/fXpmiYHNItfuBKoSHXhxH6Tqa4VmLz2K2pXZkIRrYcMhqhV07noLytUidOx+yaAtmjSIkGT7TD9EmgpoVcqbRJP/yMqH7xiJktPvLFAuTti2u8VwK6jY2XLFzqFwaWXNiANEQ+OyZelaZL6PwsZEDx1Fw87BJRgJm9WNADhkiDqeeKr103t8qHd/9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq0OkZCM4NvWqI7l52vAB0yZqeic5UlySv4Iz7q5Lco=;
 b=bTWNdlOdvFI5dwvZTosupOzvxoX8HSGZ1WJLNOqROdkQXgpRwFkhCzRM/b/wISGaQ5YQVq3Pqoplz0ZgFztPXZpq1is3bTtlvCuzP2Xvqb6ExI8R5Diccm9g8ml3XoGJJG59Lj0imuFuPcw55C6Mw5BHgwbG69dbRSsBTzcyTtWAQx/6/XziAgIHu/Pzgg6YQyarfJPaZxjzAqJSv/UElJb6WZZez91pt5WhqMrdWWImOoL0hhet7kablZkcDww7LSj6pdZ/mzX10f7yy5OAppRLAhkN9EtcSWnkzSkx19UHT83X2xzbX0tZC2AAM/sZWbV2eUbdWiWJqCjs37wV3A==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB2130.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 30 Apr
 2025 07:29:05 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 07:29:05 +0000
Message-ID:
 <MA0P287MB2262454C19B8899BC1694D04FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 30 Apr 2025 15:29:00 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Inochi Amaoto <inochiama@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>,
 Ze Huang <huangze@whut.edu.cn>, sophgo@lists.linux.dev,
 unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.15-rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <6fb285e0-911d-4a54-9ec3-ea35e3bfcf32@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB2130:EE_
X-MS-Office365-Filtering-Correlation-Id: 82246b3d-ea20-4b43-1e73-08dd87b8afa3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|461199028|5072599009|8060799006|6090799003|7092599003|5062599005|15080799006|10035399004|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXdZSTFWY0hOUGZ5ajlaUzM2QWN6clp3TjhpSmNhNDF0cVlXUTdzbTZ3dWFS?=
 =?utf-8?B?clNKUlZ5U2h4dXo5THdQbjRpYk9aQm5udHJ1L3dhTDBaa3FuSHFmM2JiRG5Y?=
 =?utf-8?B?bmdUaVhyZUM5azZvbC9JOWRoRi9jdEJMMlFFWWpGNGhLUUl2aS9kZzFDTHpG?=
 =?utf-8?B?L0dFbzBtVzcyY3dkR1lmZWtab3lVNHh0K0p5UWtud0pCQ25qM0JaeENsSmRn?=
 =?utf-8?B?MDNyMmVQZ1d2d1hrc29YbE1JTU1oejZlNjhXVmZtVFVlcEVsWVpBSlNDaVN2?=
 =?utf-8?B?b0tJNjdmVU0xT2FrRlRwcVl2RklkRmFTN1hsSzBFQzBYYWZsL2Y1UU01R2tq?=
 =?utf-8?B?UjUwRGgwcEFmajMzOXBjanpIckdpT0lpbm45QW5Kamh4emg5UFM3MXlqRC9K?=
 =?utf-8?B?cXNaYzN2bEtKSmtFckdsT1c2dVRGMGJCRTBsNFhmMURVNUd6aWFjTzFDMndv?=
 =?utf-8?B?R1ZHWGdnTGx4WjJBUkRIb3htQXlGWkJETXN5QUROWlp5NFBtSkpkM2dUdDdh?=
 =?utf-8?B?ZWZrTGYrQktqVzZZZ2lRQnQ1N1RhVW9HUnk2YVp3M3NXejBjK2tPbG1qWWdI?=
 =?utf-8?B?dlFZZ0FnbXF2ek9WUEF3L0ZUUktiWEVzc3JGeGlCa2RtMlVDYlEybkg4TWFm?=
 =?utf-8?B?SngwS05seVh1aXhQU3FVbmxncThBRXRQOGFkZUZTZnFaaGZNRm5uNEhpZ0ZT?=
 =?utf-8?B?bUNsU2JWaTF4c0JqWDZ4K1NWenlUSUM5c0hjVHN6ODBYM05yK3BGZnJVTDRZ?=
 =?utf-8?B?UmUwMTh4MCtYaHloTENURVk5UXVjVU1VNDNoR1k5N2dSRUdBdXoxUlg1TDZ3?=
 =?utf-8?B?WVJwU0JOb3FSaTRwQkhwQ202enhUVHRoVkVmZXViVnF0aVNHZXFyYnB0Rzdh?=
 =?utf-8?B?dUpxbk1FeXNaY05TRW1tSG45aWxreXhBK1VNR2YvWDRkV3BTYS95RUlMVy9D?=
 =?utf-8?B?aGxHbHp6MFdSaVl0RXlBVmhnYVNLQWNTMmRZbkkrN2crMDZkelVmZHBRRmNX?=
 =?utf-8?B?OWJsc2gwekRoYWVtWUFzcUFKVUhubTVuN0ttMWlVUGZUczBZbHUrcXEwRlJw?=
 =?utf-8?B?Y2Y2dnpqaTdZYW9VaW1PY2pXQzYzTUI3NUdZVVA2d3dod1kwcTlObTFWYlIz?=
 =?utf-8?B?ck00T2s4bGZXT2VMaXN3WGhjaXdidC8vZ1FzSWZWbU1scXhGclFsc09hKzNk?=
 =?utf-8?B?UndZOTFNTXgvcnRhWUVpWnJLL2JqYkl0cG4xY01HOWd6Z1F4MG1vUXBkVlAz?=
 =?utf-8?B?TVlKcGhIMzdOWDJydXhNcHA0VFo3SGFBRmFWL1Jqb2tkajgxZXFyMXNMYm92?=
 =?utf-8?B?L1l4YkhWOExUZ3hTc3hIa3h0RVY5Q1VpenRCbjFGa215R1ZrQk9GcFJWRnNp?=
 =?utf-8?B?MDRkc3YxL2l4all1RUZKbG85SlVEbEFwbWgyeG91cmNLemc3dXduZzRLaHlm?=
 =?utf-8?B?K09zeXZFZEFYNmVsY01HTlBxcmVLYm5ZTURGSVJSbDUzOFhVQUtReTNGWGxK?=
 =?utf-8?B?WFdrL0NydXZpTmU4SUdjUFVjNXJNTk1iYWNCTEVlT01XWG1Rc1VKbFNSa09u?=
 =?utf-8?B?cEFYR281cmlMRWdCNjZTYVlUT2N4aUI0V0U0dWRabXJHUjRzemkyTWUxYlcx?=
 =?utf-8?B?RU1BZG4rLzcrK3dETWhxTlIvb0laa0VTRlJrWHF1TnZscFJ3RTJZRUhhOTEz?=
 =?utf-8?Q?90d1cMZtSBlVvflyCpLl?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3VSbVFYaHVKTG50NjNhVG03eHhNelNVWU5FOTZzcm8wZXpkVjg4ZWg5b3JI?=
 =?utf-8?B?Sm82Ykc4QUhrR2UvQzBjVGlHUzZWelRsVmV2cENnK2N1RHBGdEc3NHpoQTVj?=
 =?utf-8?B?TnZVM0lrclBGV1Nvck16cVRTK25yNWVSVHBBeWZjRW9LbzhTQXVYcU1jNVRF?=
 =?utf-8?B?M2xpc1owNU11OC81MU9lNHNDdUZxelkrY2ZweDFkU1ZXSkFuQzZQaDdWRklY?=
 =?utf-8?B?SHVMb3RJUDlhejlwakMveGMrNlJOTzVnY2xmUjBpcnhrNjN5OUdMQjU5VWlr?=
 =?utf-8?B?VkQyL1FIaDlLaDU5NlIwR1h6b3VHMk9VNGJsMXp2cHZMNWN4T1Fid1pxNXhm?=
 =?utf-8?B?YTQzV0ljMGt6cmZaQjBjKytPS1pBbkxJT0gyaTNYL2FReVVqOFE4RkRWUHhV?=
 =?utf-8?B?SHhqRWVRbFJrb2J4OTYvbWF6MWhhRjlyUVVHdGZFeVF5REZwcW5kRGZpRzZl?=
 =?utf-8?B?dWFUMWV1N0xDNmVPQ3psbDBHcWcvb0trNHd6ejJVdmwyU2ZFa1hnWXI0eDAz?=
 =?utf-8?B?aFRaZjErRDFFQWFVdzNvUktuMFR0S3krdmsvdktoMmQveHE5bTBsOElDYmF0?=
 =?utf-8?B?ZUQrL2NNY1BjaDBVdGhtL3pNUkRUUTl3d3BUZ3hEcEJwZnZQSG1kTXJIcjYz?=
 =?utf-8?B?WkpGYzUraTdqeVVZcEtCS2gwdGdNRnhSWkFRWVNSU0pkRXBjTTRWVFJ4cHdF?=
 =?utf-8?B?bi9oSWNPUmRTQzF1dWhTQTQ5VWpvdDhuckthZDFXQWc2TDh4K0hJYW8xRDlE?=
 =?utf-8?B?dkFKMy9SVk1scWdEclZHclh2bXBkRXYvcHBLdWRobENXOGc2cE53bTR5QWtS?=
 =?utf-8?B?RDgwR3JjWTZud01wVTYzbGVRTlhWYmFrSEVUbVJXTmZxaGpGZUZLUjZJbmow?=
 =?utf-8?B?TnVnMnhhMm1VcGl0MGpZblAwVkgvRWNuNTVOQ090cmsyQWprZGNkM0Z1RDA5?=
 =?utf-8?B?d2NSZ0UyajRtVGVSL0hBN0R5TDhLb3hRUmdLZGkwWnFpZmhIQkR1Q1ZMc2J6?=
 =?utf-8?B?S2I0b0t0UVRyREFCSFZWem1aS0prLzVrTXMwN1pWVkxCTWFRQmlsTkZRUUNV?=
 =?utf-8?B?aWRnYTRycTVVTGQ3UGxCWmRGMDd0REZ4Q2Q1eTFkKzd0cGhLTEk0RUxTeWVQ?=
 =?utf-8?B?OFNyalN5TFNsN3VlTE1oZ2hqQUd0NHdvNU4rRmZrY3ZhVFNBVlZveUtsdDZ5?=
 =?utf-8?B?bm1CYmMzTXpCbFpNKzBsVHFIZmxkc0wrWkpwZEJHODl4am44ZVVRMFRkQnJN?=
 =?utf-8?B?M2ZsaWZuY3FPTDhTREkraktHR2dOSDF3UXdWQXlrZXVFZ2xTYXBETEFwdVgy?=
 =?utf-8?B?aDVoL0NtdGwwZ2RiZVdpYUVFODdLbHFTamVMeUFPQUNpQWtEZ29icjNUbE1I?=
 =?utf-8?B?dE9xTlRuc1lKREE5YVFscVE3d0E3OEsxeHNFQW1Bb1dyc0dUSVVVbnhJL0xx?=
 =?utf-8?B?YnZWR0NNV1ZINk1VTVQ4UjFFdlhzUUlnaWFzZ1dUb1pBNjVaVjUxMmIrVmhh?=
 =?utf-8?B?Z0EzVWs1d0p2VDZxbjBUVlV0V0RpVTNwVUVHd2ZzckgwUzN5akFaT3JoQXBI?=
 =?utf-8?B?SU5vZkNmVUJFK2dWU2IydCtSd3VPaFdoZk4vYklONVlQNHJrWjNtR0lTQVpQ?=
 =?utf-8?B?Tjd2aFAwaExEc3FMTlEyZ3JJRkVseXE1SmNSU1hCNHJpcFhVL3dxZ0F3M2Jh?=
 =?utf-8?B?UWo5NUpRUmRLT2U5ZTlWU3pVclVsZDFlZjRIdFNwc1h6YzFDZXdkVEFVbXl5?=
 =?utf-8?Q?ZfDu+Vb0ou+k8tYv3PMdFlPOMSKiFSs7e6gwI+s?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82246b3d-ea20-4b43-1e73-08dd87b8afa3
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 07:29:04.9569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2130

Hey Arnd,

Please pull dt fixes for RISC-V/Sophgo.

Thanks,
Chen.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git 
tags/riscv-sophgo-dt-fixes-for-v6.15-rc1

for you to fetch changes up to 3e6244429ba38f8dee3336b8b805948276b281ab:

   riscv: dts: sophgo: fix DMA data-width configuration for CV18xx 
(2025-04-30 14:51:43 +0800)

----------------------------------------------------------------
RISC-V Sophgo Devicetree fixes for v6.15-rc1

Just one minor fix to correct DMA data-width
configuration for CV18xx.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Ze Huang (1):
       riscv: dts: sophgo: fix DMA data-width configuration for CV18xx

  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)




