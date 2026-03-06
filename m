Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B12405EB
	for <sophgo@lists.linux.dev>; Fri,  6 Mar 2026 04:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772770516; cv=pass; b=Nm20Img9ohKkQQ3Qyrx4QaZQNNhaph06W+3wmSRvhPs9Pf7xt14+BGhS2WgVtQX8DYYPAU8Exn6GbprwxRocWsuPwq+rlcTmFx44tN4Ncb3pjVdwAa26AztC+fjpnol1Okh2lPFtF+g8vG9P+zNlL0d+141Q/9jRLLbjhNinHoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772770516; c=relaxed/simple;
	bh=nFIzFCEGdHvUoDkDKio798vd3KSOQ+BKfInvObQxhB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cb4tgjNzbqRieDhBOsUFpgudZeDFJ90Q2HMkTQjV80JZ3l58jxwZpj3inE6nc/wWohOq/rCmK+5CSB6GcoVmTSuAQXhggf2mXDSxOBH423Pq+FaNFwyQ9e2wZT/mEdCoukAgQYSrQ2whQc9z00kLwJP5EHHnNApZ44UORbo5x/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQcnkjI3; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQcnkjI3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9431300833so13450566b.0
        for <sophgo@lists.linux.dev>; Thu, 05 Mar 2026 20:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772770510; cv=none;
        d=google.com; s=arc-20240605;
        b=H9SQ2/kAlAwkgHvTB20Z/97REcjJNBuFTtazzH3vJrM7MYAsTbB4mw+GvsJ81VKaAq
         xvcjemrkGPLtM4wYDX06a/4ryagOMmTJrapjJSVK0tgtWlEbv6OfwDPYgfK/TVGTDHuq
         2Z5NZtoHF8ZCGFkVwvJgo/0nkkaAwRoBZCbVZAMwcqWbGAd76KunSHLqbxH6DISkV9yt
         Nhyveyfz0GBLeCqm0hRsoGyBSTUfGWrwr47oXc9l6ewzgYo45OVYtuKk1SwKNLSiuSr9
         mP24mwhJoArj20/YoESc2ozI9zTr1aHP141+luKOnnOtashOJ/q71Qld+vDMTzFz4dRm
         kBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        fh=R1W+Lq9/wvb6T1VVXLu8tjGZn/kfW4RQYp1OK8gBwkk=;
        b=fHMNi+2pLuvv9boYXjgQCJznYOfq71szEVEMlNkAg413APnRQKL+TI4mrhIRLpsAvn
         H6uWyPT6GJVsif80vciEZM6Uf+5fQM0moneHD8zBILP5tIHTBJxiuoA1247dOHDWCgAl
         mVSAwGTmD6ThsFo7U9GioieQ2mGk043K7rWfPoYj9lHo9oGo94M5dD1iJb711pTNT45v
         kxDICbPCiKuVuZVl98e4I2MwgQC+vH26/Kg0IjYgrZd8llHJ0GN7Uy6+cWi0Ogc+cY4q
         Jjxjxx3N2v8RdpTFfybUieHX82xsZOK28QVfzMoaTA5nhVPpng/DMnLnRPqb1gjg7doW
         5s+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772770510; x=1773375310; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=aQcnkjI3rpyman3+SFK5yhwOKKSfv8MSmiSGq5viBXP7/TR2nS89ImGedzd4T5TyQR
         WXSsh+UstN/Uu9B+raI2bDulo50p9SpdShO9W0CMRafn3yBk76txWe4DD9dyEcW4/pUB
         kQfjAtRbMGfVXiQm39JX5aEH30O7ugNZtoUmLOB8zdnmu4cwkHMEVs9DNfVK5wjJSs6M
         zMVIpja0hUDcJu7Amqpmbmy+XNN0UpfbLr0sKOPLftV17WYP3omFFT4QHMj0QaEa7t70
         9iqcY5246erBdkAlZL2TaT4V58I2z8RslP7nkkyjWG3Bu+rowutp6zMebuKYTfi+DLJY
         g2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772770510; x=1773375310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=fTgJ95OA1hN+uHV2IANM/bezUccrEkwUbfV0XYOeGQcdSLzbZHHf+uznLLhuHQcgYi
         rQ4OETKp7St+oAjgm0Vmjy+YONR40HPc9G6/XZm5nGpaL+wkLrVTjnCdqWuRn8Me04oe
         fzJqdaZpsiN7jLF1uIU0rQ5VzEgLq9yMm5HM4iUfgiWsfSRgBhka1eXCgBaPAz0DCTFm
         /RJn7Bp97vIVsCyCkVd8xCCPIOrTT0VDF2SmGrl9ux/SRPCQDXLEgcjlyxGfQPCWZK3t
         LTx5aB5RPsQxOhfdGSKcyWIqc0Q1xu+ehdkNBXd1FrL8vDsNb7GsHe9GD0LztfqnKm5F
         q0BA==
X-Forwarded-Encrypted: i=1; AJvYcCVyeA/xPmbTr8XmqX/dBHdNb3bshTfruezRI+OErLmUYE3o4i+BwZIL9hIvW841bBFHBbtoiwA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKaRcZY7LA4xTsfV+iX8DJU/fueLNqLh5bYhiN1WBbg7UymET2
	3Q26GR2mzTA2/qKefzvGf4syQ9x6mykaO8rLbXAdpDdVFk0JH/ydu2Xum9Bj+T0ub345r9c673B
	OCZawVYHhuE94NJYZ+7uid1jG5tdJL9Y=
X-Gm-Gg: ATEYQzzIWC9rn8kri+HHcW+Z4Bln36PUUY4bwHlyrzABzjIMUX/zR2vtMNYRvQ/KGUO
	ltr/zp5tpwTVXmG/gHT1fTuQRvbq67rvMV1AyDQdHADwLcgNgh7REJRRJQoWcCiENTaf5OW7E/R
	Tifai1DiQSQbgmqlThRxqr2HL8iRRswWLnIKrmEd9Y/PB4LrGbcnYnzNQ/5acnGBtxWZ5XrHuL5
	Sex3nvhYN19vPHcuXop1WO7pt8imU5dsQLfrbNWEVBKGOcsv12yvO56+jWdhMIRyzIKnPKdWzAJ
	fk2AAg==
X-Received: by 2002:a17:907:6d02:b0:b93:6bfe:d556 with SMTP id
 a640c23a62f3a-b942db8682dmr33539966b.7.1772770510037; Thu, 05 Mar 2026
 20:15:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304140329.7089-1-linux.amoon@gmail.com> <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 6 Mar 2026 09:44:53 +0530
X-Gm-Features: AaiRm51D8WbPwjbtXZGUsnsbSyyBH4WmUaM2xaSBTKwsUjOwhQr-zWi1-hyOtG4
Message-ID: <CANAwSgQ8eKV4jyxGeva_2aT98sPW=44Q9J5PxMgJ-bs3XdwrkA@mail.gmail.com>
Subject: Re: [RFC v1 00/18] PCI: Enable async probe by default
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Chocron <jonnyc@amazon.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Xiaowei Song <songxiaowei@hisilicon.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Niklas Cassel <cassel@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Koichiro Den <den@valinux.co.jp>, Hans Zhang <18255117159@163.com>, 
	Sai Krishna Musham <sai.krishna.musham@amd.com>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, Vidya Sagar <vidyas@nvidia.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:PCI DRIVER FOR SAMSUNG EXYNOS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <imx@lists.linux.dev>, 
	"open list:PCIE DRIVER FOR AMLOGIC MESON" <linux-amlogic@lists.infradead.org>, 
	"open list:PCIE DRIVER FOR AXIS ARTPEC" <linux-arm-kernel@axis.com>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:SIFIVE DRIVERS:Keyword:fu [57] 40" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Chen,

On Thu, 5 Mar 2026 at 05:57, Chen Wang <unicorn_wang@outlook.com> wrote:
>
> Hello Anand,
>
> On 3/4/2026 9:51 PM, Anand Moon wrote:
> > Following recent asynchronous probing updates to the Rockchip PCIe
> > controller, this change enables default async probe functionality for
> > all DesignWare Core (DWC) based controllers to optimize boot times [0].
> >
> > [0] https://lore.kernel.org/all/20260226101032.1042-1-linux.amoon@gmail.com/
> >
> > This PROBE_PREFER_ASYNCHRONOUS flag help to parallelize device initialization.
> >
> > Thanks
> > -Anand
> >
> > Anand Moon (18):
> >    PCI: al: Allow asynchronous probing for background link training
> >    PCI: amd-mdb: Allow asynchronous probing for background link training
> >    PCI: armada8x: Allow asynchronous probing for background link training
> >    PCI: artpec6: Allow asynchronous probing for background link training
> >    PCI: bt1: Allow asynchronous probing for background link training
> >    PCI: dra7xx: Allow asynchronous probing for background link training
> >    PCI: exynos: Allow asynchronous probing for background link training
> >    PCI: fu740: Allow asynchronous probing for background link training
> >    PCI: intel-gw: Allow asynchronous probing for background link training
> >    PCI: keystone: Allow asynchronous probing for background link training
> >    PCI: keembay: Allow asynchronous probing for background link training
> >    PCI: kirin: Allow asynchronous probing for background link training
> >    PCI: layerscape: Allow asynchronous probing for background link
> >      training
> >    PCI: meson: Allow asynchronous probing for background link training
> >    PCI: sophgo: Allow asynchronous probing for background link training
> >    PCI: tegra194: Allow asynchronous probing for background link training
> >    PCI: uniphier: Allow asynchronous probing for background link training
> >    PCI: visconti: Allow asynchronous probing for background link training
> >
> >   drivers/pci/controller/dwc/pci-dra7xx.c     | 1 +
> >   drivers/pci/controller/dwc/pci-exynos.c     | 1 +
> >   drivers/pci/controller/dwc/pci-keystone.c   | 1 +
> >   drivers/pci/controller/dwc/pci-layerscape.c | 1 +
> >   drivers/pci/controller/dwc/pci-meson.c      | 1 +
> >   drivers/pci/controller/dwc/pcie-al.c        | 1 +
> >   drivers/pci/controller/dwc/pcie-amd-mdb.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-armada8k.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-artpec6.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-bt1.c       | 1 +
> >   drivers/pci/controller/dwc/pcie-fu740.c     | 7 ++++---
> >   drivers/pci/controller/dwc/pcie-intel-gw.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-keembay.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-kirin.c     | 1 +
> >   drivers/pci/controller/dwc/pcie-sophgo.c    | 1 +
> >   drivers/pci/controller/dwc/pcie-tegra194.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-uniphier.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-visconti.c  | 1 +
> >   18 files changed, 21 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
>
> Suggest you indicate in the title of the cover letter for the next patch
> that this patchset is only related to dwc.
>
Thanks, If I get positive feedback I will append dwc in the $subject.
> Thanks,
>
> Chen
>
Thanks
-Anand
