Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF46A21FF3C
	for <sophgo@lists.linux.dev>; Thu,  8 May 2025 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746742944; cv=none; b=nMK97R70Jz2tpG3f5MoG7Qn5L6wpQ+sjDsCU0MruwoRUDo0heIYSrV0wSq299qD1HXPtgbLosR0FBYyNYHIkCV0j4fXlWxjdCC4+4VNixb4ksb1foZGJLhWlrFT9W3le+JEeJfOI3lCScZAihzhsCI02A/hCSBBPLckUJms8Z08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746742944; c=relaxed/simple;
	bh=x8ncZbBnesK2pUhqAMnfU/mEnGXb8MQmhLNwSQevhuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYU30+aK1/rPsJdIREjOyPwN4lD40k5KKM0Vc60tVBMF7WI6cA/7ZkRORsujutFTSOBnYzxwhL7GrIqe5ujGfDGej/qtWpRdrMoS5eWH3SzzReQt4E0ZWzIMdo6Kbk1m9EJLExroO54vTFWq6HSdvnJqI7RkqG46BesMYFxGIPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyNHgTHU; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyNHgTHU"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f53d271b7cso13804206d6.2
        for <sophgo@lists.linux.dev>; Thu, 08 May 2025 15:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746742942; x=1747347742; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fg3GK54oLt3wm9wAeXHbwjv1eDR1lDC2mM5d6wedhCA=;
        b=JyNHgTHUiuTZp3bsKXdjiQukmIwTeN8hM6dT1/QKpMmdUC8ew+F1kv0kLjQqeOK1Xn
         MIkLQxJB7HSbHk9DeDIwQ//XazxBQCdQUGJ5VW3/YtVPIdfxKf4ES6BmebHb6J3DbhLF
         O7rPLd1g5gQ2tU7k7JvQJ8F6k8Sv5a/9uIgPnjlKLmU9cDJnEZ88It3tozmV2QXkDi7R
         wBwPqg+Jd0jZZHBBXLZkI1bU6Sk6tDd6f4NxNndYlpdaiqtPvT+ttRRhTjZE3RoOPKe6
         F74Z4h9/fpM4VcpXr7LBIzMa94vsda6BEumPxRzLXzvrcl2dZKCxEfWNzK4FwgxA219o
         cwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746742942; x=1747347742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg3GK54oLt3wm9wAeXHbwjv1eDR1lDC2mM5d6wedhCA=;
        b=hJY8tsQmKX3N0XUQctP6JOFzXwzxvOEwvSf+1AhuImFgnQcVxan6zScKb3kUWUs/cQ
         TkIS60DUKDnvupuEClXxqPT2OpJwhUXMOZi3M7F0GNTlSMIWGG4EZcqrTNI9QU7Uh0Ai
         oXvPQV4ecBN9li9AQWAiKfbOPQBU2bFk7fh9MN5vu2Xiq3MPsreGKM3OoVhx2DG6myqW
         nP00UB+fX2T6mkf75pCvnw8bplkUfpUgC7LMI4pa8Claiy0Gv6Na6kp0nJpuivJhlESf
         S4GO9agg0i9DlHhsiGeAn8wJbt2tVgcMctbri/99TSX5o9Lt8IW06AjnGG+hxWfZptvc
         GOIg==
X-Forwarded-Encrypted: i=1; AJvYcCU2CD2CcX60LqWcD3BT+6moFM+Spj2ju2bDW7T4Wr2GNHAUN16bcuYDj5J1tiY21C7zmgOPg6k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdXU64yrEv/HBopkQHOyKkh9poNXVvwCCHFSj6T60RBbns+xjK
	dZG6kzVi7z0U0/hwN7RIoos29F+LYEyCT1ZgbHDQVlrqcNFdGngd
X-Gm-Gg: ASbGncurKaJvat/P1IDkAuvylPmhGgP1KWK2HGDx7L5379Qy+zicpgJaJJzUUqXJZNh
	cihQ/KaNzGMq58SjAqCM6EEzO+ma8RByPrpzolhjgTkchVPKj7WGABua6yIp1VbFHyg4xEUaNM5
	5xMpof+JMF9EpabJPke0VViuSFEuwFdofD4Xb7YUn84ht9+vnVo05MoxC5gqk+6SiUjx74y/x4b
	ivPh2csdPZdoZjXYYdQVNLax39HElVkbvJp44yiHuRUvI0QvhUmiCvZqH1KmoYY8gP6APDMvS8J
	Nzvhs13VQgD5vK86uJh2ZctzDgU=
X-Google-Smtp-Source: AGHT+IGPmKRd9i0agUYQ+31u6dVr+1AcCz/bSh5SwzVf+qyh1WTBCd3FwcBZCnD03Hf6e01yuwXv0Q==
X-Received: by 2002:a05:6214:da5:b0:6f5:4079:3189 with SMTP id 6a1803df08f44-6f6e47b9beemr15826506d6.2.1746742941721;
        Thu, 08 May 2025 15:22:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39f4821sm5210406d6.33.2025.05.08.15.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 15:22:21 -0700 (PDT)
Date: Fri, 9 May 2025 06:21:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Message-ID: <dm4l3wfcuygmuylz6uqn2g7wztg4tyrjbm24hqcpffjnpkwany@ib2nvjibq2wl>
References: <20250507195626.502240-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507195626.502240-1-alexander.sverdlin@gmail.com>

On Wed, May 07, 2025 at 09:56:20PM +0200, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Implement the RTC driver for CV1800, which able to provide time alarm.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v15:
> - the only patch in the series left
> - dropped changes to MAINTAINERS file
> v14:
> - https://lore.kernel.org/lkml/gztsdu5p4tzt7emlwiuc3z74f4tfgkclcyrl324prqzp6dqhhf@ezrdmmhvf2nm/T/
> - platform device name "cv1800-rtc" -> "cv1800b-rtc"
> v13:
> - Change in the Kconfig dependency caused by the move of the previous
>   patch from MFD into SOC
> v12:
> - added MAINTAINERS entry
> - depends on cv1800-rtcsys MFD driver
> - use syscon for regmap
> - get named clock from parent MFD
> - corresponding platform device is expected to be instantiated by MFD stub
> Changes since v10:
> - only start RTC on set_time;
> Changes since v9:
> - further simplified bitmask macros;
> - unconditional RTC start (rtc_enable_sec_counter()), otherwise
> didn't start on SG2000;
> - dropped ANA_CALIB modification (has been forgotten in v8 with
> the drop of SW calibration to switch to HW calibration);
> - successfully tested on SG2000;
> 
> 
>  drivers/rtc/Kconfig      |  12 +++
>  drivers/rtc/Makefile     |   1 +
>  drivers/rtc/rtc-cv1800.c | 218 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 232 insertions(+)
>  create mode 100644 drivers/rtc/rtc-cv1800.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 0bbbf778ecfa..46593103db11 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1395,6 +1395,18 @@ config RTC_DRV_ASM9260
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-asm9260.
>  
> +config RTC_DRV_CV1800
> +	tristate "Sophgo CV1800 RTC"
> +	depends on SOPHGO_CV1800_RTCSYS || COMPILE_TEST
> +	select MFD_SYSCON
> +	select REGMAP
> +	help
> +	  If you say yes here you get support the RTC driver for Sophgo CV1800
> +	  series SoC.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called rtc-cv1800.
> +
>  config RTC_DRV_DIGICOLOR
>  	tristate "Conexant Digicolor RTC"
>  	depends on ARCH_DIGICOLOR || COMPILE_TEST
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 489b4ab07068..621b30a33dda 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_RTC_DRV_CADENCE)	+= rtc-cadence.o
>  obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc-cmos.o
>  obj-$(CONFIG_RTC_DRV_CPCAP)	+= rtc-cpcap.o
>  obj-$(CONFIG_RTC_DRV_CROS_EC)	+= rtc-cros-ec.o
> +obj-$(CONFIG_RTC_DRV_CV1800)	+= rtc-cv1800.o
>  obj-$(CONFIG_RTC_DRV_DA9052)	+= rtc-da9052.o
>  obj-$(CONFIG_RTC_DRV_DA9055)	+= rtc-da9055.o
>  obj-$(CONFIG_RTC_DRV_DA9063)	+= rtc-da9063.o
> diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
> new file mode 100644
> index 000000000000..18bc542bbdb8
> --- /dev/null
> +++ b/drivers/rtc/rtc-cv1800.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * rtc-cv1800.c: RTC driver for Sophgo cv1800 RTC
> + *
> + * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/rtc.h>
> +
> +#define SEC_PULSE_GEN          0x1004
> +#define ALARM_TIME             0x1008
> +#define ALARM_ENABLE           0x100C
> +#define SET_SEC_CNTR_VAL       0x1010
> +#define SET_SEC_CNTR_TRIG      0x1014
> +#define SEC_CNTR_VAL           0x1018
> +
> +/*
> + * When in VDDBKUP domain, this MACRO register
> + * does not power down
> + */
> +#define MACRO_RO_T             0x14A8
> +#define MACRO_RG_SET_T         0x1498
> +
> +#define ALARM_ENABLE_MASK      BIT(0)
> +#define SEL_SEC_PULSE          BIT(31)
> +
> +struct cv1800_rtc_priv {
> +	struct rtc_device *rtc_dev;
> +	struct regmap *rtc_map;
> +	struct clk *clk;
> +	int irq;
> +};
> +
> +static bool cv1800_rtc_enabled(struct device *dev)
> +{
> +	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
> +	u32 reg;
> +
> +	regmap_read(info->rtc_map, SEC_PULSE_GEN, &reg);
> +
> +	return (reg & SEL_SEC_PULSE) == 0;
> +}
> +
> +static void cv1800_rtc_enable(struct device *dev)
> +{
> +	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
> +
> +	/* Sec pulse generated internally */
> +	regmap_update_bits(info->rtc_map, SEC_PULSE_GEN, SEL_SEC_PULSE, 0);
> +}
> +
> +static int cv1800_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
> +
> +	regmap_write(info->rtc_map, ALARM_ENABLE, enabled);
> +
> +	return 0;
> +}
> +
> +static int cv1800_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
> +	unsigned long alarm_time;
> +
> +	alarm_time = rtc_tm_to_time64(&alrm->time);
> +
> +	cv1800_rtc_alarm_irq_enable(dev, 0);
> +
> +	regmap_write(info->rtc_map, ALARM_TIME, alarm_time);
> +
> +	cv1800_rtc_alarm_irq_enable(dev, alrm->enabled);
> +
> +	return 0;
> +}
> +
> +static int cv1800_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
> +	u32 enabled;
> +	u32 time;
> +
> +	if (!cv1800_rtc_enabled(dev)) {
> +		alarm->enabled = 0;
> +		return 0;
> +	}
> +
> +	regmap_read(info->rtc_map, ALARM_ENABLE, &enabled);
> +
> +	alarm->enabled = enabled & ALARM_ENABLE_MASK;
> +
> +	regmap_read(info->rtc_map, ALARM_TIME, &time);
> +
> +	rtc_time64_to_tm(time, &alarm->time);
> +
> +	return 0;
> +}
> +
> +static int cv1800_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
> +	u32 sec;
> +
> +	if (!cv1800_rtc_enabled(dev))
> +		return -EINVAL;
> +
> +	regmap_read(info->rtc_map, SEC_CNTR_VAL, &sec);
> +
> +	rtc_time64_to_tm(sec, tm);
> +
> +	return 0;
> +}
> +
> +static int cv1800_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
> +	unsigned long sec;
> +
> +	sec = rtc_tm_to_time64(tm);
> +
> +	regmap_write(info->rtc_map, SET_SEC_CNTR_VAL, sec);
> +	regmap_write(info->rtc_map, SET_SEC_CNTR_TRIG, 1);
> +
> +	regmap_write(info->rtc_map, MACRO_RG_SET_T, sec);
> +
> +	cv1800_rtc_enable(dev);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t cv1800_rtc_irq_handler(int irq, void *dev_id)
> +{
> +	struct cv1800_rtc_priv *info = dev_id;
> +
> +	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
> +
> +	regmap_write(info->rtc_map, ALARM_ENABLE, 0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct rtc_class_ops cv1800_rtc_ops = {
> +	.read_time = cv1800_rtc_read_time,
> +	.set_time = cv1800_rtc_set_time,
> +	.read_alarm = cv1800_rtc_read_alarm,
> +	.set_alarm = cv1800_rtc_set_alarm,
> +	.alarm_irq_enable = cv1800_rtc_alarm_irq_enable,
> +};
> +

> +static int cv1800_rtc_probe(struct platform_device *pdev)
> +{
> +	struct cv1800_rtc_priv *rtc;
> +	int ret;
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	rtc->rtc_map = device_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(rtc->rtc_map))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_map),
> +				     "cannot get parent regmap\n");
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0)
> +		return rtc->irq;
> +
> +	rtc->clk = devm_clk_get_enabled(pdev->dev.parent, "rtc");
> +	if (IS_ERR(rtc->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
> +				     "rtc clk not found\n");
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtc->rtc_dev))
> +		return PTR_ERR(rtc->rtc_dev);
> +
> +	rtc->rtc_dev->ops = &cv1800_rtc_ops;
> +	rtc->rtc_dev->range_max = U32_MAX;
> +
> +	ret = devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler,
> +			       IRQF_TRIGGER_HIGH, "rtc alarm", rtc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "cannot register interrupt handler\n");
> +
> +	return devm_rtc_register_device(rtc->rtc_dev);
> +}
> +

I wonder whether the rtc driver may need reset (maybe optional) for this?
If so, please add it.

Regards,
Inochi
