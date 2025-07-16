Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010010.outbound.protection.outlook.com [52.103.67.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED99DDA9
	for <sophgo@lists.linux.dev>; Wed, 16 Jul 2025 00:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752624175; cv=fail; b=i0Z9B+5ZuTCBExVi8ubGO2Gc0+/wfvxQWbMU7ujGMamTZKxeiPsMvDS5ltfqyIb7PF5M+icU2mvnMRnJDSjoWhMwOdHVY1yuMuzNRNEF/NX4R/1fDDD2sclNkgkyszBTldSSaeh7Da6Y3b7LMabn9yp0JyeKG0dDAiC/01el4ME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752624175; c=relaxed/simple;
	bh=1lV8BEQiwZaUfg7vy5xMnmkEAVgWSODQ5EQDLKW81oY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PVFU8mMzmDmirket5i0kY8PwXH5VyZH3HnlWloqOvNVHrfRPAzA2wMujHy7Z6Ft5phr5zbpjWByxwrdVyuGqvTONqV1sbNwNiY6yM++lxB7vi5hqlkYyDFNq/SMZScA31psZeSU7A4WID15pbLr4yKKyGeVfZguCLdp6rCOzUe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=R3woOiob; arc=fail smtp.client-ip=52.103.67.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="R3woOiob"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffgpuVngxPVlXJoiYCtRG3IV6g7tjJM4bsz3gqRXphN46w//5tycx/CanIjHQ0UiGBehcQuR5hRL17S2KJftZirLo0CGL8MrnsnhPHp6o5ZOXivEfQRU8C/TSmoShbZuRLY943XDBDnzFNVYixQlgiYwoGgceyv1R9svrB2EfhdoxWYmb5xZZOq7cNXEuEJuJ7un3PHL4EatNN0sMSNuzn7bBXja1zu8l0Pdw/9z73EE9/Edwd+f5I6JYN3vKXqlg31FTRIECSxauDZRk45knHjECsgq3MDXX45tATREkJ3+HI7q/Trn0V2nP65agStMZHiUeaNQL5xFoPlKb39kWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMP7yh9HdQXoPKYO57CyilHjquLL8ZpijM2iBXwWEng=;
 b=R2xlHa3/0Ptd2l18FlzT0IJYF31WRVuQW/sUrTyiOXl1cS0kvptN7gC9ZqALBcHwq5ZgflxZWTwdABuzYI+EFJDrkrSDD9v+FFAdxrejnoEMx6jUJz56+H7tXSZQWFGzOfTRUi6jp+XPy589DJgRQ+7Vpm/ByBlSUOgqrBsxf2hHiipedo8umAaetKO9VBCiSqVDIbOKGYXLNluNqD5xTdQN9JsTOXwQhLLc+olt3pQJSc/Wqy3Xi6eK1U3HHrNe0GuQnB7JCRNJD8FEoaWFcjebNTDLz0U7jpWFUjA43PL6Or+1T5ol+tORGRn0ULCCK40TayEkzLJkINd7IMc0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMP7yh9HdQXoPKYO57CyilHjquLL8ZpijM2iBXwWEng=;
 b=R3woOiobfcdJs2BxItR5fNOf/E798zCy6PlSAij2umlPcqktGw7QQlTJHaY47xnQB6HxWUay7eWnBroyB0i0UHwYitIGW0gVuRE07p4WbuwtidgtP7ITZAD64b2dUwjjBBeQxvFh+HdklsuORzQ4+Uj88UwAQX7oG6oOh/hDT4NvVVrRfQl9Az5czyyxLK0Z0vktNmGm5OFyuUcGhT2ePCg/1X47XTO6cHuHPE/+ShhMK6ffFxhtNb9x1a1db66Jr7ag3lzDe+Lv8WSKh2xruFzQMrvnwvxUi4WZGfHy8EgAz+eS2jHVsaGDGSlTebmcvFc55kpZXtEQnRbKH9GKcw==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN0PR01MB9238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:120::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 00:02:47 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 00:02:47 +0000
Message-ID:
 <MAUPR01MB110727528F71CCD79A3ACE321FE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 16 Jul 2025 08:02:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>
References: <MAUPR01MB11072B86FA33FAFCDA1FD2D1CFE54A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <MAUPR01MB11072B86FA33FAFCDA1FD2D1CFE54A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <e7f9d9b6-f990-4e8f-9698-8e3b656d401c@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN0PR01MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: f35bd1d8-7285-41d9-22c7-08ddc3fc1878
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|461199028|6090799003|5072599009|40105399003|440099028|51005399003|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWlEUWRic2VyejlIekdwUWdUQ0t6Yk5vVWdwUG1wMERnU2d1VnVFUitYTkFC?=
 =?utf-8?B?TlU5cVo4OTV3cGtWUGV6dS9GZy9XVzc1Wk5pYUtSOTZ4TkhzZFIyaEQwc0Fn?=
 =?utf-8?B?MXlidnYwSjJtbHBHNitSWXlxZDlYS25QbDJZbG1FVXkxS1FXZllFK0RUdm4z?=
 =?utf-8?B?S0NyQ2haNkZvTm9aZ25MV2Faazh4UFNKY2ZpQVhJczFDUTNUSXc2a1FBOThY?=
 =?utf-8?B?blVlaFpwOWpXb0Foc1pDcGNlSnpDSjl4bmtUYlFkNEdqeU4zZWRTaUVjRjQ3?=
 =?utf-8?B?UThablB1dXNFa1dTUHRHU3QyOTFGQ08zdUFOWGRESFRHc3QrN3hWYnpQbEkx?=
 =?utf-8?B?eWk2Yys1T044VmUvbVRORml6OEd0L0JxVDNSUTVpU3l5V2owTEo3TmtrL1lz?=
 =?utf-8?B?cWlFQTM0OVEzTDRoVVorOXh6VXFjMTd5bEtNR3IreWRqYnpSSU5pQ1hRTFZo?=
 =?utf-8?B?UFpDVVNweG9RWEYwWGFSaWFmSEh1RzRjQk5zeW1oSlhvZjFEMUxzMm5ESE1C?=
 =?utf-8?B?cHUvNFVvbkd3WFBoelpRTDdtc0NpekFKb09rWW9BYjcxanpjMno3QlBxZTVF?=
 =?utf-8?B?dEZBbEJkbytJMjZLbTFXbEhNTUFTejVWdmVST003RExuV05yZXhYU2toK0JN?=
 =?utf-8?B?VzZ2eHo4a2VzZHBNVUxmTEQ4V1VYUFN1ZE45dmJuT21mc2h6bTVOTkRSdzUy?=
 =?utf-8?B?ZkdiSjNGLzNQQWl3ZjRXclF2SG45TEZWM2FGaENacDNYVTB2MnhpaDJaYjBE?=
 =?utf-8?B?aUVqTXRzTmhsaXJiTGJLT1hxMHR4VG9pZEtiRlJ3RDVXNFlVZi9UNmJMdkJT?=
 =?utf-8?B?R0ZnK2NaOVV5SERMLzY2THd4VEpGS1RWMlpCaTNhY2J1SlFBM0JJYjFDNHc5?=
 =?utf-8?B?TlBQRHB2bTRobFJxTXloLzdsaGduZ0FiTUNnekpDOTlkUHExNjd6eGtMUVdy?=
 =?utf-8?B?dFdva2hVS2VhSnh5Y1VSUDlIYzRWZVUrVDhRU09Pc1ZwbkJKOWR2NzBGd2hF?=
 =?utf-8?B?UkphanIrMHFOTTBkRjd3WUJNd3RBQUN2d3N2NkdGWHUyTWhBZzJSV0pQajgv?=
 =?utf-8?B?cVNXdiszdlVwcWs0RXpldG8wQmtXS1pHQkdsV0R5czhDcUZzL2lNUEs2V1Np?=
 =?utf-8?B?c3FDeG5tY2pnNU02REZONWcvWjg2ejBMTzVnVmJnbUtaZ0JFeTBsQmVNZlVG?=
 =?utf-8?B?MCtNNlBIVUE4SFIvUWE0ZndZM0VsK2F4Y21DbXhvNE1JUng5WExFczNmUzhK?=
 =?utf-8?B?eHVHS2phdWNabHVGSjdNSDJRcHNCNXAyU2hkcldwS0k2bGNqbEs5S05YSVdy?=
 =?utf-8?B?cHUrT1lGQ3hVY21HZmFDb0VOUXZId2ZSMjdVUnVtUUNHUVRxTFd1YkpVTGRk?=
 =?utf-8?B?cmplUjJGTlZGdjduR1VLelhmNVY5UEs0MHZHN2RERGdNL0tGaFF0QWdIOWdY?=
 =?utf-8?B?WUx4R01LaXNRMmI4YW5QbFl1bUFRZFRtRk15TXkweFJ6Ry9MUk9BK0FtQUdo?=
 =?utf-8?Q?q5hHf5Fdai5tBJPwjGYuJgVwjDU?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?by9IZHp6TDRIUXJ2RGxLdEl2L21Jd2lNMWlLWW15Rm9kUG9CTkNCL3dCeHZF?=
 =?utf-8?B?TmFEMWxjV1RSRTl2aHpIV0dxdW1EdFlSQy9QOWZmVnNINzR4aFNlNEpMUE9Q?=
 =?utf-8?B?WXVMYlV0bHAxc3VJQm1Ncmg4OS9CS3ZON0I4bXFtKzBTbWNScWNjUFRBMlRj?=
 =?utf-8?B?KytOMnMzaXRFLytpTm9vck1CL1NZdGFnTGJicHlWcHUyWGVrK0VNZ3NxTVZL?=
 =?utf-8?B?SmhmNkRkK1o5Ni90YjV5bzd3Z2Y0T1U0RURteWloR2h3MWdqVW94WmFHK3p5?=
 =?utf-8?B?OSt2aHhLYWdPVUljVERZdG5xN1pFN3R1R1pCYWRoTkc4TmhiQW1hTW1YWEtF?=
 =?utf-8?B?SVVydEhOelFCS2tVdzZwanFDR0o5ZGFVQzdmcTV1eE14Qy9GRmtzTWsxVDhX?=
 =?utf-8?B?UGNSTFlKQU5EL1dFV0JtZWRzYUJEcUoxeHhnNU10M2d4SUZjSERhSEtxTEFV?=
 =?utf-8?B?STBOZzdtNFBHZC9RWCtEbzFYTUd6TDJ1SXh2RGxZRS9CT2F3b3JHc25qdjNp?=
 =?utf-8?B?RVEycnZLZnk1b3RqUVJyZG5kaUpTazRzZ1ZvUTlBaGlHSTBZZ1ZqeGV4ak1u?=
 =?utf-8?B?ZEhqSElETWdCWVBlMkNhdk52cGh4d3F5WGtxN3VJYnVyZEJVd2FMMEl4U3cr?=
 =?utf-8?B?K3p3UFRUK2pXa05JK3dualZXVStxWlZ2MVk0cmFZa3dsWGRXL3RvOHpYTXZN?=
 =?utf-8?B?Qmh1ejFoclFnRVBxWk9leVJDMGk3UXEzMUtpdUdkVVdXck9XYTRaSlRWbXAz?=
 =?utf-8?B?SmJVZmkrNEZNcHRLaFlBckpZVmVwOHNCMjJISmlyWmJrYmxjZUFjSUVZMTN1?=
 =?utf-8?B?N2Z1VVZVdWNHbHBrdEc4MmlUSW9LYThFZ1pJR2NLbUZqTzQyZDhtQ2phd2Zw?=
 =?utf-8?B?QWFhS1U1bUliS3VGWFkwMktjVDdOeU55SHJ4clN2NlRGbXNoVEpmbDUvOEt4?=
 =?utf-8?B?ai9LY1FHU0dtTlhHQVp2YnZVVnFlNDVQV3JPek1xdnZ1OXRnNldZLzRMaGda?=
 =?utf-8?B?NmlyRCtIc3JJaUlSRWUwSGVsekxidHpiZXM5N0tqTnB4QWhHQU5QUm1Eb1Nt?=
 =?utf-8?B?dlU2YmR6bnF4NEhLRHE1WmZURWFHWWc1cFVmTjJOZEhTK2xuN1lOUXFyeGgw?=
 =?utf-8?B?N1ByOXQ2WjdUcUtzNEVtQ2lIZGM4UVZ0cDNoOEduVmRJQk5QN01QOWkrbjdJ?=
 =?utf-8?B?Rm0xK010Y2JWRkt5a2tsaG1FSzNhSStmZFNNYU9ibDBHOFVPbytxVVJBcVNE?=
 =?utf-8?B?ZExpLzRBK0VYMncwanhaT3FTZ2RrOUFRd0d0bVNwakwyVjZyb1MvcjVtR2ZE?=
 =?utf-8?B?aFhkV2VvbW54Qzd3aFplWG9RWDlVTUpEL0Z3bXBvLzMyaElHZTNPZnVMMWxt?=
 =?utf-8?B?eXJ5OFlxdVRUZkJ2Mnl5Ulh1NTRjR3NpMlduSWxncThzNmJ2NG9sSFdEdlRC?=
 =?utf-8?B?NjJsVjFHa0c0QkJacFFNbGZWV1VaaitqK0dhSVdyS3hNcVlWK3k2cUlVczYz?=
 =?utf-8?B?ZDZyUTJKTENReGgrTEpEYVZzR0lmOS9tdWprSW9oL2IwVWh1aWNMbTltbGtW?=
 =?utf-8?B?UFMrN1ZzeTUyanBjeFhPdEdxTjJDWHVoMlVlNC9jZmRLQ3Z6enFpZEpBbito?=
 =?utf-8?B?MU4wSnEydEQzTTJ6aktQRmtPZjh5ZkorYjdRdWZiRzhtQUVJOGJscFpGQVQy?=
 =?utf-8?B?TWxGRWlweTVIY0s1QnpvR0d2ajc2c2I0MnJqUVNjWjBJb0ZXNHhlQjJwM2ZL?=
 =?utf-8?Q?sdbHcb8Rg7JP56/avEmWxw+jEl7z43L+9DLk7lO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35bd1d8-7285-41d9-22c7-08ddc3fc1878
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 00:02:46.8989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9238

Hi，Arnd，

Excuse me. We just discovered that we missed a patch and I'd like to 
withdraw this PR. I'll re-tag it and issue a new PR shortly.

Thanks,

Chen

On 2025/7/14 14:05, Chen Wang wrote:
> Hey Arnd,
>
> Please pull dt changes for RISC-V/Sophgo.
>
> Thanks,
>
> Chen
>
> The following changes since commit 
> 347e9f5043c89695b01e66b3ed111755afcf1911:
>
>   Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.17
>
> for you to fetch changes up to a3ec6cda33ea16e3b7cfee80a6278085948cb793:
>
>   riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device (2025-07-14 
> 08:44:04 +0800)
>
> ----------------------------------------------------------------
> RISC-V Devicetrees for v6.17
>
> Sophgo:
>
> For CV18xx serials:
> - Add rtcsys device node.
> - Add reset device node.
> - Add ethernet device node.
> - Add support for Duo Module 01 Evaluation Board.
>   This board uses SG2000(old codename CV181xH),
>   which is dual-arch, RISC-V and ARM64. This
>   patch add the support for ARM64.
> - Enable ethernet device for Huashan Pi.
>
> For SG2042:
> - Add ISA extensions such as xtheadvector/ziccrse/zfh.
> - Add ethernet device node.
> - Add Sophgo SG2042_EVB_V1 & SG2042_EVB_V2 boards.
>
> For SG2044:
> - Add pmu configuration
> - Add ziccrse extension
> - Add missing riscv,cbop-block-size property
> - Add MSI/PCIe device node
> - Add pwm device node
> - Add SPI-NOR device node
> - Add pinctrl device node
> - Add ethernet device node
> - Add MMC device node
> - add DMA device node
> - Add I2C device node
> - Add GPIO device node
> - Add clock device node
> - Add system controller device node
> - Add HWMON MCU device for sophgo-srd3-10 board.
> - Reserve uart0 device node for sophgo-srd3-10 board.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>
> ----------------------------------------------------------------
> Alexander Sverdlin (7):
>       riscv: dts: sophgo: cv18xx: Add RTCSYS device node
>       dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, 
> add SG2000
>       arm64: dts: sophgo: Add initial SG2000 SoC device tree
>       arm64: dts: sophgo: Add Duo Module 01
>       arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
>       arm64: Add SOPHGO SOC family Kconfig support
>       arm64: defconfig: Enable rudimentary Sophgo SG2000 support
>
> Han Gao (7):
>       riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
>       riscv: dts: sophgo: add ziccrse for sg2042
>       riscv: dts: sophgo: add zfh for sg2042
>       riscv: dts: sophgo: sg2044: add ziccrse extension
>       dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
>       riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
>       riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree
>
> Inochi Amaoto (20):
>       riscv: dts: sophgo: sg2044: Add system controller device
>       riscv: dts: sophgo: sg2044: Add clock controller device
>       riscv: dts: sophgo: sg2044: Add GPIO device
>       riscv: dts: sophgo: sg2044: Add I2C device
>       riscv: dts: sophgo: sg2044: add DMA controller device
>       riscv: dts: sophgo: sg2044: Add MMC controller device
>       riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
>       riscv: dts: sophgo: sg2044: Add ethernet control device
>       riscv: dts: sophgo: sg2044: Add pinctrl device
>       riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size 
> property
>       riscv: dts: sophgo: add reset generator for Sophgo CV1800 series 
> SoC
>       riscv: dts: sophgo: add reset configuration for Sophgo CV1800 
> series SoC
>       riscv: dts: sophgo: sg2044: add MSI device support for SG2044
>       riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
>       riscv: dts: sophgo: sg2044: add pmu configuration
>       riscv: dts: sophgo: Add ethernet device for cv18xx
>       riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
>       riscv: dts: sophgo: Enable ethernet device for Huashan Pi
>       riscv: dts: sophgo: add ethernet GMAC device for sg2042
>       riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
>
> Longbin Li (2):
>       riscv: dts: sophgo: add SG2044 SPI NOR controller driver
>       riscv: dts: sophgo: add pwm controller for SG2044
>
>  .../bindings/{riscv => soc/sophgo}/sophgo.yaml     |   9 +-
>  arch/arm64/Kconfig.platforms                       |   6 +
>  arch/arm64/boot/dts/Makefile                       |   1 +
>  arch/arm64/boot/dts/sophgo/Makefile                |   2 +
>  .../dts/sophgo/sg2000-milkv-duo-module-01-evb.dts  |  76 ++++
>  .../dts/sophgo/sg2000-milkv-duo-module-01.dtsi     |  40 ++
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi             |  86 ++++
>  arch/arm64/configs/defconfig                       |   4 +
>  arch/riscv/boot/dts/sophgo/Makefile                |   2 +
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi             | 110 +++++
>  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts  |   8 +
>  arch/riscv/boot/dts/sophgo/cv18xx-reset.h          |  98 ++++
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi        | 384 
> ++++++++++------
>  arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       | 245 ++++++++++
>  arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       | 233 ++++++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi             |  61 +++
>  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 283 +++++++++---
>  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      |  87 ++++
>  arch/riscv/boot/dts/sophgo/sg2044.dtsi             | 499 
> +++++++++++++++++++++
>  19 files changed, 2041 insertions(+), 193 deletions(-)
>  rename Documentation/devicetree/bindings/{riscv => 
> soc/sophgo}/sophgo.yaml (76%)
>  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
>  create mode 100644 
> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
>  create mode 100644 
> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
>
