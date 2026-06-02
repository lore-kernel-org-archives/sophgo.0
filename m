Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCBE3B6370
	for <sophgo@lists.linux.dev>; Tue,  2 Jun 2026 22:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438530; cv=none; b=iPod/fB9aOVIknEDE3Hqn3RIFdjWvHfXbB1XlkljaUngPq49ofo9lwj49z5wyno+IrIkkT64YV+t0WJQS67xXU0Y6HVTtPREyUFLg+tY3J/lHTFwiNbRGRL9W3Joei+tEvNp3OBv80gULK+5S/+B7MT8JHPLRgn3sEqle5ZNDFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438530; c=relaxed/simple;
	bh=PkFkKBkasyNkfpdY3psVfIwGsVxbjYhDPSzlbu1Zp/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxRS2vEFdN+kNyHjlFa2Do1t1yW+zo2gkP6/TMm1StOyFON9FySy2xKA+8XY7AQdpBZKwnlZwhmnVSbwiEJYsjZwMoPEUXsTNlqpltjCWCVOvsTa3cOklL/lQwpMQE1Q7mQqyp7Yuzw3svm2rxALSSA1y+KQ/25sHs41OfUedGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFZIDKi0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFZIDKi0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36da8439078so2543260a91.2
        for <sophgo@lists.linux.dev>; Tue, 02 Jun 2026 15:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780438528; x=1781043328; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wyg13nmb1cl4XVRXyc9+1Xf9pv1Lvsh32cV5wFSbV18=;
        b=TFZIDKi0IwHxPRvf9MOd5YZ8XjIr1xxnAPex2QnxCoO76SUWNNCRTK/MXz963c+LV1
         P9GcJo005lPFW60081cmfIvDzuBP19Hjug1dlxxW7wbRtWYMPzHkHQ0+BR433Mf+4EIX
         /2J3XJ495IO3Eq4wJX5h/9aeojxNXwAJvLosVTgxZF4nAFHwoEoH1dHlpBmTynmCosgW
         kVkbbQcNeN2q3ZIw8oFwede8VDywLULJ0/O35q8VNRcwn7kxdfN/cSQZAkgMaeuQkkB9
         ax9GPC1l+t4t5Cu5E/zkB6/reE6Gtn9WmkLPerGtSxm4N1lkQeyqHLU2vkymDPXSWekZ
         kF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438528; x=1781043328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wyg13nmb1cl4XVRXyc9+1Xf9pv1Lvsh32cV5wFSbV18=;
        b=onMiBNoSEsk0OL3CLY9Dyg5VRAs8pm82EH1N4gmq55usuF0ipNOqeRel+YV/NCoEWl
         Tk8nVUsB2ZIt3wgcDUSRTIJ+rxy1jPOC02FpakVlC9Nl/T9t+a4v1UVL2FASbsV4zKqP
         7fWob20f0mlI3HrduWnv/DgHLa/l28jCRotkQYwlPHhT4thBhXTnqewCA7j+C6o6WVZK
         EhyB5XwaQDcc0W2fNM6SWBFdixIyOMjYZ9I8aHR9PzgQmuw4wsWf/rCo41hyeAfvLKKF
         CH+M+/lS+OnJzdd0wAq083OXPQwgEI0VagorIp8KuKohpSGtESKlQSx3Na2pkJMkPZrN
         0d5w==
X-Forwarded-Encrypted: i=1; AFNElJ+XmfjPMyOGWb5aJa6MXzkCe9A08YwViXqFRDtRA/SbAIaPyamnUwq5p00rdRqeprkX/fRh6TU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNBF4hmjSKbM6pCAj3OSqwojEMf1OLtA6YDbHOox2tmno3QAyb
	Xmu5ObLxbFQaJoxZ+gap5NdVkb3trPPhQfgF2peKfbHe6sIEXbkkwORt
X-Gm-Gg: Acq92OFMFk/1biHDgW+sneFXXiVKcq18jerYIRAzn4ozkIvyb4sBjVk/XswDnhdN2c/
	asXfDiZu2I27n6Mf8+onAYT4A6fpXjuJ1E9+Dg29sJitNYgFWD4E030V/soUBUfd5bcL4m96EE1
	BMn6SdKaq2JvJr+oTco0m5RIKZbdhef00JJYS/+63XSycmBe3ZsC8x+8whD/y3nSSkuntaA92PY
	UhJ8IeFUD0UbNJRyiBjfilyszf5bS/OzYlZ1eyjT6COCXoXJ2gnN7jdCwqm8SKP4DrQpFGd9cmK
	3LWFhuTH0f4jGUYsYJNyaahsIukpOtzN4lsayGtFdYVmksgsW9biVSefqD9+JdWRywLudxQ0k4y
	K1TM2MPxDXvshLnEJMZ9JRfss19IoBuQhpkYuhdMtmbnxxDF4xL9IQdjivHggCq9aSSz1qSGFqZ
	NtIDKGgzXYXUMiY4fJClP+9cyrlkaBdxz/gJrT8SchQsT3
X-Received: by 2002:a17:90b:1d87:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36e2f3c11dcmr712758a91.7.1780438528332;
        Tue, 02 Jun 2026 15:15:28 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e174db6afsm287366a91.2.2026.06.02.15.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:15:27 -0700 (PDT)
Date: Wed, 3 Jun 2026 06:15:08 +0800
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
Message-ID: <ah9VwHZbIuDSqmbe@inochi.infowork>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
 <178028263198.557087.6386925175219722340.b4-ty@b4>
 <ah6gcvKQlHlrW1qn@inochi.infowork>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah6gcvKQlHlrW1qn@inochi.infowork>

On Tue, Jun 02, 2026 at 05:21:32PM +0800, Inochi Amaoto wrote:
> On Mon, Jun 01, 2026 at 10:57:24AM +0800, Inochi Amaoto wrote:
> > On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> > > The SG2042 hardware design supports cache-coherent PCIe.
> > > 
> > > With recent firmware updates [1], it allows to use DMA coherent.
> > > 
> > > [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> > > 
> > > Han Gao (2):
> > >   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
> > >   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> > > 
> > > [...]
> > 
> > Applied to for-next, thanks!
> > 
> > [2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> >       https://github.com/sophgo/linux/commit/e728a57834d06b9bbf9bbed69e3ea16416d257d5
> > 
> > Thanks,
> > Inochi
> > 
> 
> Revoke this apply due to https://lore.kernel.org/sophgo/ahu57vcS0oOFmCI9@mertle/
> 

Reapply this as this error is resolved.

Regards,
Inochi
