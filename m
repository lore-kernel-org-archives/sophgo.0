Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43C77483
	for <sophgo@lists.linux.dev>; Mon, 14 Apr 2025 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744592058; cv=none; b=bCwgMGaEUhvICAMyAFslYxR/2emVlWaSuZFZ/1fppaZat+mlwpGdtmPsDgVyUVKu1lp6zgnfughdOwMKHXxRr/2TWPyGuOWlOkk/Txyx8e2KH1C1eRmElf2KghqhpRxp9m4//aXOm6ojAuyBO++sB1iRs/04CQfnUzwOWJ1PJ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744592058; c=relaxed/simple;
	bh=qgC/Ro2YCevvViw7+wQ4N9W6yfmfYdFYPh0FG4Rejzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yd2vuYihkWC9XgE8RqKzF6zDEnqoaAIrY9iZK2X3ApHjTx5vMWj0BOIP0Psxf4a/DtxoV+/+skX5/ygQe7izZjBx6Jue2gWv3JRPIRHPl+F/Mo/HY8wTYcJ2w8DEzPZA7b01w2SuPMbvqpqHM7dXrAssWpFro/N5A9vyW3sfukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Frhei2Ss; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Frhei2Ss"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476805acddaso36063431cf.1
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 17:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744592055; x=1745196855; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=asGs9dXkrGA46BHiM7NeGGpvrCsy2QV43JKsFZnCKvA=;
        b=Frhei2SsUC3Z210YqRGp3mrMI51vKOr2lO4b8buQizM5q5KiHZaNbWvoiBN4OSvwXO
         HVg9PXiyNyne158oZOPuRNBKD1OlKqGeiEk6tA+UbKfgY0aweUvJxuyySLLZnYfAJmfx
         S1vKE1dVmn2m7217EUjVnr6kecAYSIadT8CaFPLDh6rexozEp/xDKpxXAKeNWNnESA4z
         1NcBzPKQM4e+WBW96Apd9Fv3p51DWUB3qwcnCpzQSRldJzgtY8kcFEDc6RnOi+qRln92
         ywkbrbiEbnZceph4RB+vuLcwc28VDVfM+PV45z7dfpdd/+mTf0BiQWCo2znZ4+1oolWI
         qS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744592055; x=1745196855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asGs9dXkrGA46BHiM7NeGGpvrCsy2QV43JKsFZnCKvA=;
        b=QFKjZUozqh+/zrhN2QaNJbZ5fCxq9ocdind2GoY0HgaMFGBVJ1iLfa9sq1E39YqTM0
         Sn8ShSO9e0aeN9Q5OFzJXYM6MyGDEyaOyiZaWz/1sfjMUtQvCP0TZUrbD86m02TNXOIM
         qA9q4I2WUdDo4MGz+8HJdHV+MFQLMWI3I40kRAz/KDjzdAmI8eqAzPaLpDZYXMnF/A6F
         ZSOSd/N1JCtIto00rt/KL0Mv9Xqjz0BL2ExljtGy3d4id7owEUO0DZ1RChZ/sUN+pkSq
         6l14eZCgivXIGaBDDLMOJSMEb4GyNSHiL4yLGD+6H2KGY5OmDPs6YM1bIWpV4wpuGsv3
         pRbA==
X-Forwarded-Encrypted: i=1; AJvYcCUN1IiY1el52EHSDJGuXdPZ1FsCYLmWivibhW54uXHJOv7HeV4ykVuNVv4XOMMTMra43KXtH6U=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywsa4MdfF2lU1cOUfoIf1H9rliqfmSiIWY3/3KoWl4MQvV7iq7I
	lj4gr/XW6vLlNwfmnJCy+a8oh16l9qHFmKEE9WfKZggZIVURwGGO
X-Gm-Gg: ASbGncsN0bytBO+oxaybp7x2rpPLV0rHuLNpPPIZAgcS9w/vsk1HORfHTIEALvZuFcN
	0a6bcCdOZKNMfa70PnacckKjed+8p1RKXRxzv6RuoBgJGkVn6zu49DeUiDITfqWwbIEyRanT+Gd
	XW6+q0pKMlE9ZZ3BtPDf+gCCYfOLzJz5FKmo0BFY6zoCp+LdF//Cw+QHPjMrk40iSfDFIG5DK3e
	23QuzNRCcnewIbNhaIjVKQWhyw9kBXTNAmSFl/oVuVFbBGBBDnlgbBQ+WFjYGtjopWdKFZCXIAX
	BUfsvSSqmY+uXHmp
X-Google-Smtp-Source: AGHT+IE/g553Jq6yYD7LJpfkVi+E7INfcm4IyV0loUESRRflBjB6CD+tv0Ju2q/t0uPdjZL7ZYpN9g==
X-Received: by 2002:ac8:5d16:0:b0:476:9f3e:1806 with SMTP id d75a77b69052e-479775e3614mr176219131cf.46.1744592055398;
        Sun, 13 Apr 2025 17:54:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796ea65130sm64422851cf.0.2025.04.13.17.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 17:54:15 -0700 (PDT)
Date: Mon, 14 Apr 2025 08:53:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Chen Wang <wangchen20@iscas.ac.cn>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 3/4] irqchip/sg2042-msi: introduce configurable
 chipinfo for sg2042
Message-ID: <rss7pih2lpzi65vw57exbr57qby6edsb5dvsntcvkllp32t6ou@nbub4ubbrd4i>
References: <20250413224922.69719-1-inochiama@gmail.com>
 <20250413224922.69719-4-inochiama@gmail.com>
 <MA0P287MB226272482F161A5C6A74638DFEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB226272482F161A5C6A74638DFEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Mon, Apr 14, 2025 at 08:44:46AM +0800, Chen Wang wrote:
> hi, Inochi,
> 
> On 2025/4/14 6:49, Inochi Amaoto wrote:
> > As the controller on SG2044 uses different msi_parent_ops and irq_chip,
> > it is necessary to add a structure to hold the configuration across
> > controllers.
> > 
> > Add the chipinfo structure and implement necessary logic for it.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> > Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
> > ---
> >   drivers/irqchip/irq-sg2042-msi.c | 52 ++++++++++++++++++++++++++------
> >   1 file changed, 42 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> > index c9bff7ba693d..1001c1117b00 100644
> > --- a/drivers/irqchip/irq-sg2042-msi.c
> > +++ b/drivers/irqchip/irq-sg2042-msi.c
> > @@ -19,18 +19,33 @@
> >   #include "irq-msi-lib.h"
> > -#define SG2042_MAX_MSI_VECTOR	32
> > +struct sg204x_msi_chip_info {
> > +	const struct irq_chip		*irqchip;
> > +	const struct msi_parent_ops	*parent_ops;
> > +};
> > +/**
> > + * struct sg204x_msi_chipdata - chip data for the SG204x MSI IRQ controller
> > + * @reg_clr:		clear reg, see TRM, 10.1.33, GP_INTR0_CLR
> > + * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET
> 
> I remember asking some questions about this last time, but you didn't
> respond.
> 

Oh, I forgot to respond this. Since the SG2044 document is not opened
public for now. I think it is possible to leave this for someone to
reference it. Also, I find nothing about this address in my copy of the
document, and was told it follows a similar design of SG2042. So I
think it is OK to reserve it at least for now.

Regards,
Inochi


