Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93D278E6F
	for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 10:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552853; cv=none; b=t+T6VpbD6Lk4gafm3nlilgBgFI/2Zm0wEF3TrYAJ+3lkrFDZoJMBPEHvQ1J/roi45ABiD4Oy4513tMEmUkDs5KNwj7eQ+K+eyBOJCJ1FogZI9EJCLPjyXDAcYcFyRSPIwAHXmB2/zqDgKtl3poxzSXmFQirpiuYt4EzdNzbkJZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552853; c=relaxed/simple;
	bh=mQviaa5V2BjjhvHYyZlmKWM1K820SYfQTPKwzwoi/sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4yJ1ulwLjTiHXstTyVxZsbjBs6gnzDECeJdY23j54OkrQI22bsrjy6Q7/gBsQXtQsqS95k2aVEhCB3RF5mqnBSCjRI5OpyL44WnSQ34h0Fyk2dWAEipJ5cVAyqE5II2+D4CatWPJdaYo2v9RGyY9bBqi26OeWIR32dyf4YK8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUpRka0f; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUpRka0f"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0ad744811so36849016d6.1
        for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552850; x=1750157650; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aciM/RtAI+o7KSDm0f9yisjYVs/6j85ozLAsY02zURs=;
        b=iUpRka0fmZv41XLF9MXAhGv7gtWAES7DQJZdZTXrwoCYFOZOo6xAJJFBO1n2+A3ZNi
         8B8Lr3LLv0c4AoXxcv1izQHeRuOPqvUrGaZ0tntX12M4c8VqINpIogMosI9mCPqiKjFG
         HV97k4ClKoFLvqa+/Pbp2t7gVLgcqZS/31ZE0RMaVVKXWfK9bC5nXTEhbliGYQ/mYjx/
         jRcR6hALap7nx7XWnfR0gbpiuoFB84ccYAFyGtdorEyIvz124zZwvguLGg5Y7+SDNXbO
         fwd9mZ/FnPwX10AJLYPi8szkhPQP5W9FFHywR0v1r/U5wmvF0WqhFJX+y+o/Y2Te2e9k
         w4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552850; x=1750157650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aciM/RtAI+o7KSDm0f9yisjYVs/6j85ozLAsY02zURs=;
        b=NfmL9RVVbknvCaNiAcgsqyuVf3yJHPM5uPME168C8soicE/X34OiW/JMMwdQFBn5JC
         72yFbzwwXeAa78Oh2YfuPbSvkb2O+Lq0F8JspX7eaQHvULobtfNrpNDfZ4uXpXB6Vklp
         O4fxI/1DG8zLsI6UbvIswmOi3Z+5kF9ojPOHQw1npblyJKFbB4FlArcBxeisLF+ycP4N
         CMMwjRdiPmlr4GrSh60O8lHD87hS8B9gcJL0hhqTZEoKozudmqkoylJfc8TiY+y0wg3z
         AynbFAQbX5+57tJW94rCnIM753eR4hZxFQdqDJowljCcp7fMxrWiTDV6Tu5q81S8VKha
         5yEg==
X-Forwarded-Encrypted: i=1; AJvYcCVz8IFi4gPcuvbLAKmC1TyaxZ2WDN1sAifoYA2mLZBGmfpJTy58utUQboPF3bPUaGIcmb9lN8U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+VQGUdUYpVMwVivRlhO1E/bvztxLaSak3deb2NWiicD+O9Vub
	zF4ZMdSPcaQ3sn1x+5AYw7GGmWdoTdzAVtpl8inL5GbC+mKoCdTu5BHh
X-Gm-Gg: ASbGnctWd+mkLDtlBBqnxbvuE1/Cni84xtVKVs6GTXhDC7Qt+5rar0ZCD1kcDEAvmXo
	H/edDzzKciEFtncBsYUx7ps5PjuhlTJpYU5alCHlqg1FvRdF4blpQdOmjVG1On+B4N5Yb6VgShv
	3Ph4VZ88hkFLLwrsaScBlTbRe6D5dR0RrP7AQV22LTV4Z5QrslsFWn2iwmq+6WQtK9Zegcw476D
	VD1O7YqzBpUbQxvvyBU3BQSEdLyr8XTsJ7ltBwQL8Pak+Z0a4ud7/XQI2IQH/tYEu+MqobJyj97
	DqeX9nQ7vHCWa59FSLrGhj22g2ks0sNd76THPw==
X-Google-Smtp-Source: AGHT+IEo8uu+V6aspY6hh94sC7blb0U3CV9AGlaOO83e1hYVMKVKokyGqG4hkNCz9kFeCPCNDFjT6g==
X-Received: by 2002:a05:6214:2022:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-6fb08f43185mr264918966d6.1.1749552850108;
        Tue, 10 Jun 2025 03:54:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac94afsm64332126d6.44.2025.06.10.03.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:54:09 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:53:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Message-ID: <r5sdm4vs5wayictlhx2zfui76ksrei7bq7wpd55eo5o6ommkhm@lsx2mqsldlu5>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
 <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
 <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>

On Tue, Jun 10, 2025 at 10:46:23AM +0000, Vladimir Kondratiev wrote:
> >> +#if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
> >> +/* generic/MIPS variant */
> 
> >I do not think there is a must to add these defines
> 
> OK, if there is no objections from others, I'll remove it. To clarify,
> we're about removing both #if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
> and #if defined(CONFIG_THEAD_C900_ACLINT_SSWI) ? And, I'll keep logic in Kconfig to select whole .c file if one of variants selected
> 

I think all should be removed and it is OK to use old THEAD_C900_ACLINT_SSWI
as driver config. At least for now, I see no similar case about using defined.
Maybe the subsystem maintainer can give some more meaningful advice.

Regards,
Inochi
