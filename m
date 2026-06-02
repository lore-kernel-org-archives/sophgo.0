Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4561C3B841F
	for <sophgo@lists.linux.dev>; Tue,  2 Jun 2026 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392115; cv=none; b=Gre8wUIh9xvycOZEHAeEigSL3xO7rxxDI9Y8kBR/yEBMkidc4V29W78dDVtwJUIEJjjsnYfYGxbgc+W4XWKfbL4MFbepw9tlWZ71AguVuKFcz8Dq0kO0q1FNkg7A5UprS6QNGtZVM+W+uh6cHhpW20k9z6U8FV48B9z066kdCto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392115; c=relaxed/simple;
	bh=7WJLHqn+vCXpKoMsLpDMkqhdyw4mMxJn+ORetHQNEts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqFVPQrwa/oA7k4K/foMaOgh7e33kp56mJ9gpxXFnpYaWomR9tOioXDEuxjn+/XoPR0j0mgebiKYORUt7AH61WBrsmlVJq4A/WiXTzkvVDfMbEiF2/5R3V255+ydTNEaX28BXOixuQkROXBpkL0T++07wXCysZd5tI/WRk/XICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mElMGlT5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mElMGlT5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so14833845ad.2
        for <sophgo@lists.linux.dev>; Tue, 02 Jun 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780392113; x=1780996913; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z//VwuvdHhuIm5iM3Xnk2cWF15mlTMeV9P1PgKLz92Q=;
        b=mElMGlT5mazA78KJFnalqFBXNGoJW5IIJJde8c9NVQiHDn5viXJvTbTtwZGFrtPYmT
         a2e3+3hL17fawrpUof11w8sJQ0eBV8CSMBdYEkfnhdeayuVuvhkrvED417p+Oh6Wx0HK
         s4nU2J7CdU6jhpVnr7qNmXr6PL7QQJUvHZoKTjTnQOtBQIRXoxAHd1Ki/u6/Tx2WUxYC
         yAzcadtPcDVDuyYxmLC54a5avyCHGFFuHxj10qJ2fOlvtuFKHdnraxqsiBLcgAS0AJHa
         ZrcIHYKkhLHn022MKvBMEfSHhdrxtFcQ91NkeJQmL3hEIr6WQq7Syglgk3dGH/2SS9zc
         +lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392113; x=1780996913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z//VwuvdHhuIm5iM3Xnk2cWF15mlTMeV9P1PgKLz92Q=;
        b=JZvoNAPzpzHhJiywV/FiV7c3kRmesP9L34Fr9HONWwhtbwg4/XPwLzzPrgYhSm+N7o
         7BbpJr2QcPjU5ti4O2jqqaciYdaFbmHJcB89LPV5CnpZNfC9l9D/+SgUuJHcGrhQKeCF
         OULFnCX6kJ6/sBUbi+6gl/K83oz68IBMUa2PqvvEEGcJkG8rJxHxxiv34PVVDQ2zLTi5
         v+FS0fUy/PAxGXX21OMMGj5/mtp7m5y/Jvcif3cdEqqu8msLUcfEEx98XJ60cEMI6fOF
         NmqGcAJCM4PQV/k3jZcucldIG9ryKC6X1O3aaHjpg3Vxv9mgg2+EfALBuum5C6ndSG32
         PZ7A==
X-Forwarded-Encrypted: i=1; AFNElJ8CzqhM5lrdMWtYlixFSiAXm983QhL9flYIZ8xR02oeDOegVDjeRmq5LNPsj+HSwNl16+BMSOg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhbc2F74STtUHS1Sk2on1uWDyXcqVQrsj7nGo4js4z6cDSFZ9j
	v1fLaaYbNiuaAITn1PrH4ZeU7yE7QrRwbDQjgY4KhjTUAyz+MCdYL2nj
X-Gm-Gg: Acq92OG9XLLIV1lEsiuVwrO26jBgIDnF7sg22mBg0QkKTYTsT4mH57YzVXQ0xmb00I6
	AhFuxSWQjgr+R1HreSAgFbrJ+9HXMco8hSYc9ZWBJXHgsyrE+EUr0hunQtsr9VuuJCInfS9IgCc
	uN2bdwgOoaibUmUuMTAzLHcPrfrrY7NRT7/L7mnmUarLoHxbeSxO/Ln2LJ2O2hXgQAP7zBfbUy+
	9V6DPWirzJ8sSe5wPHmOEASW2CiYrG9vzaPiJdFacfsfae6pqNd+cWFZv/4ljeJGU4Je/O5kjIv
	Du4EjX9O9BLNTWZ5LqjAl7jRRfgZBqYroCdloAK529saWsToiWNgvRzCBEVTBMWy2MrK7S0Ts6d
	nRi4fU3EqTcCVNeRjd1zaUI62TZnonb9OUlYajMM6ha6Jy83ssyYnRNsk7ibZ/aO2eJLIvnzwg4
	tryOflYtNQttXcZkmeo7y7ndCsvqa+XVi+fA==
X-Received: by 2002:a17:902:ccc8:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2bf367f292cmr150201385ad.16.1780392113499;
        Tue, 02 Jun 2026 02:21:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c5a350sm173102185ad.83.2026.06.02.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:21:52 -0700 (PDT)
Date: Tue, 2 Jun 2026 17:21:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zixian Zeng <sycamoremoon376@gmail.com>, 
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>
Subject: Re: (subset) [PATCH 0/2] riscv: sophgo: sg2042: Enable PCIe DMA
 coherence
Message-ID: <ah6gcvKQlHlrW1qn@inochi.infowork>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
 <178028263198.557087.6386925175219722340.b4-ty@b4>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178028263198.557087.6386925175219722340.b4-ty@b4>

On Mon, Jun 01, 2026 at 10:57:24AM +0800, Inochi Amaoto wrote:
> On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> > The SG2042 hardware design supports cache-coherent PCIe.
> > 
> > With recent firmware updates [1], it allows to use DMA coherent.
> > 
> > [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> > 
> > Han Gao (2):
> >   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
> >   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
>       https://github.com/sophgo/linux/commit/e728a57834d06b9bbf9bbed69e3ea16416d257d5
> 
> Thanks,
> Inochi
> 

Revoke this apply due to https://lore.kernel.org/sophgo/ahu57vcS0oOFmCI9@mertle/

Regards,
Inochi
