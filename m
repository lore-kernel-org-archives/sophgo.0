Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471381A5B8A
	for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096286; cv=none; b=Dx7XG8XcAsju0OUUVVj9rORqWwtKjQIJkLUUgBll5cR2ZfXoVHvJSK3fwopy1IPgVbxTk6n/fgTXAkOvXP54tQHnosaH36iV/PtIX+fLvrE7FSRLTPSuydFaMlJ6Wfwu6HOhzvRlesEfiS3xumyT+AFbRpqpUCkG5FYwUEqm2Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096286; c=relaxed/simple;
	bh=I/0dsVqT3+rwe8vxTka27s1co61yM446PDMVcSZYv8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9RUmWPrIRc6RWMeWulcIXLrgdJy3PuI8hsmL30etb0aIAmdiVS7rU2i4uM2MqcEy3gdsaogkHi/zKrDQB45hJ3Fh3Le3hBs95wghQQNDCa1E2JLT/Ut+yGtoUN18t1+aFxL7P3hgfl9W54qelb3rGTaQaInQejLQPImOlryz4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okC1oU+V; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okC1oU+V"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-915671abde5so589311285a.3
        for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096284; x=1781701084; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/0dsVqT3+rwe8vxTka27s1co61yM446PDMVcSZYv8k=;
        b=okC1oU+VO1hDHb4n/9RvyZjYXxlq8FC36bK9FIwaWOQqOQtNZ2HGYNRSMl4zckm+30
         rwL6C2UOyO3UDpzONiQwXOEnY9NSt7ZIRX0oBTZns8DZLl7EUziuk3IBk1OUtjUW506H
         Bv8bGUdijitgm5/cxknmfqpt/fwfbOpXUO8euiTJGuP78rJ64G0JYf9tE0EdWlnCUUMB
         eQa0s6C1oJ4krp+v9AF5Jv3YHHJo0BQEy1S/+logv154i3ekjPgtjRaOMGmSOGyVdr2C
         d/Ep/Cdj+Nsupl49ac5Ep3zcEoDyD+S9XTN1H1EcsYhPxPYqfTOTJLY/MZdlpiP9WQUh
         ttwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096284; x=1781701084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/0dsVqT3+rwe8vxTka27s1co61yM446PDMVcSZYv8k=;
        b=GMvDsFpoaVC4Bv0LE1vNJYUMuf6xPYc0eicaG7by9b1Tt7oOtZHL/evv0eozZBGRLC
         EL4xdGj6vum224z6FxgQts2I8WStTcMd8RxynuwZmP34+7wqE91skqGqKySO1HZHksXJ
         3eSkmR2fWhBr1A1S1R+pqKsdUz9rw4y5MEnE7mhY+3U16YCwxIXFt3sq0sJEUNrXixrX
         ZEuk40jguCuQX5RCLf8hx+uXaUWXzmIZumrjRjJKkJllPJ6m6UJnFoDY8LRZ1TXz/vWb
         VLfxVWIM7PUv+HuMW1QTnEABmM2M+qBkKo8Kjlb1jT4ynOUTIeI8yiPZmfpwUM48OUz8
         i3oQ==
X-Forwarded-Encrypted: i=1; AFNElJ9h0cGYRwQaa7cx05d56L8IzkQ7Xw3DZ4EZvsIjwUYhDGNpYlUU+PYt+WRf4drBiV2g6c/5W1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUa0ySeEZFIkdtnlj4uZkqGwO12GvQlFWrNfPv5SEPgdkRxo0D
	yhPSyAk31rSB2Bmkz2p8MryAm5+W6BcdSq39R8LtAl6LBrU8o7KOTmZI
X-Gm-Gg: Acq92OEPg7bu5etlYr4cE6rmDM3cwcorZEj23EFz5ZaoZ2c8kAsJQEiHc3kPcSzHF5R
	jTolw2EHFyPn/qO3J/1jXDY80mb74cLNgz6s/D7Tikdxn5gPfseezHLgBsfZIROJzzzgdBnNqF7
	UkE/7uHiTpLg7X4Msqjis8G9TMlkXhEi0XnuqCVLgnApOKIiEfZa2oQctEcYUo1WrRclLZ8VJb0
	GYf4UktQ+5tJq/gC4CPZfxhEZF7Ol6ZYXN0C8bEdpPL0raeHLbnfxEdvi57bEBSUGfXEvCwNoba
	hoNHFH+w92r8MwRx2KKJvS2ggBpLq5J5RIt43vCbFaQ5DVOqtcxjcsAAZvNayWhk4UXiNa2rkWr
	n89kosrvUqtpSWmIBc3v68D+CBKTGWlltR/2sBnWY1y8rD3l1jPxJcHALtKvX4qE74m7ExuZtR+
	BBJSnJi34+5Nv4YRI9ZJQUNJGvsp35H1lZUcV/uc7Uw02PoAKrDUf+38SPN0n01A3HnF0=
X-Received: by 2002:a05:620a:2588:b0:914:9bed:9443 with SMTP id af79cd13be357-915a9cd939dmr4259735285a.25.1781096284172;
        Wed, 10 Jun 2026 05:58:04 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00840dsm2635584485a.1.2026.06.10.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:58:03 -0700 (PDT)
Date: Wed, 10 Jun 2026 08:57:55 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
Message-ID: <ailfU9PHrm6MDhdR@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
 <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>
 <aiawOUHBcKtMVEZk@sleek>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiawOUHBcKtMVEZk@sleek>

Hi Shuwei,

I was able to get the wifi chip working. It requires the proper DT and an
updated aic8800-milkv-duo-s driver [1] that has been updated to Linux 7.1.
The next patch will cover the DT part.

[1] https://gitlab.com/DeepHorizons/aic8800-milkv-duo-s

Have a great day,
- Joshua Milas
